import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:company_project/Services/db_services.dart';
import 'package:company_project/core/models/bag_model.dart';
import 'package:company_project/core/models/bureau_model.dart';

import 'package:company_project/pages/categ/widg/add_to_card.dart';
import 'package:company_project/pages/pop_ups/detailsProduct_pop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListBureau extends StatelessWidget {
  static const String routeName = "ListBur";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Bureautiques',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),),
      ),
      body: FutureBuilder<QuerySnapshot<BureauModel>>(
        future: DBService().getBurData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<BureauModel> dataList =
            snapshot.data!.docs.map((doc) => doc.data()).toList();
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1),
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                BureauModel item = dataList[index];
                return InkWell(
                  onTap: () {
                    _showProductDetailsPopup(context, item);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.blue,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.network(
                                  item.imagePath!,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  item.design!,
                                  style: GoogleFonts.cabin(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, bottom: 8.0),
                                child: Text(
                                  'Prix: ${item.prixNormal.toString()} TND',
                                  style: GoogleFonts.cabin(
                                    fontSize: 10.0,
                                    color: Color(0xFF808080),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, bottom: 8.0),
                                child: Text(
                                  item.marque!,
                                  style: GoogleFonts.cabin(
                                    fontSize: 10.0,
                                    color: Color(0xFF808080),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  DBService().addToCart(item,context);
                                },
                                child: AddToCartWidget(),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            onPressed: () {
                              DBService().addToWishList(dataList[index],context);
                              // Action lorsque l'icône est cliquée
                            },
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: dataList.length,
            );
          } else {
            return Center(child: Text('No data found'));
          }
        },
      ),
    );
  }

  void _showProductDetailsPopup(BuildContext context, BureauModel product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ProductDetailsPopup(
          code: "${product.code}",
          design: product.design!,
          imagePath: product.imagePath!,
          desc: product.desc!,
          marque: product.marque!,
          prixNormal: product.prixNormal!,
        );
      },
    );
  }
}
