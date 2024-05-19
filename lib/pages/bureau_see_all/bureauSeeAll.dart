import 'package:flutter/material.dart';
import 'package:company_project/core/models/bureau_model.dart';
import 'package:company_project/Services/db_services.dart';
import 'package:company_project/pages/categ/widg/add_to_card.dart';
import 'package:google_fonts/google_fonts.dart';

class BureauSeeAll extends StatefulWidget {
  static const String routeName = "BureauSeeAll";

  @override
  _BureauSeeAllState createState() => _BureauSeeAllState();
}

class _BureauSeeAllState extends State<BureauSeeAll> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late DBService _dbService;
  late List<String> _categories = [
    'Ecriture',
    'Fixation',
    'Calculatrice',
    'Accessoires bureau',
    'Consommable',
    'Colle et adhésifs',
    'Tableaux et affichage',
  ];

  String selectedCategory = "";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
    _dbService = DBService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[100],
        title: Text(
          'Bureautique',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _categories.map((category) {
            return Tab(
              text: category,
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _categories.map((category) {
          return FutureBuilder<List<BureauModel>>(
            future: _dbService.getProductsByCategory(category),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erreur: ${snapshot.error}'));
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1),
                  ),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final BureauModel item = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
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
                                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                                  child: Text(
                                    'Prix: ${item.prixNormal.toString()} TND',
                                    style: GoogleFonts.cabin(
                                      fontSize: 10.0,
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
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
                                    DBService().addToCart(item, context);
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
                                DBService().addToWishList(snapshot.data![index], context);
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
                    );
                  },
                );
              }
            },
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
