import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:company_project/core/models/bureau_model.dart';
import 'package:company_project/Services/db_services.dart';
import 'package:company_project/pages/commande/ResumePanier.dart';

class Cart extends StatefulWidget {
  static const String routeName = "cart";

  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  TextEditingController _quantityController = TextEditingController();

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  void _updateQuantity(String docId, int quantity) async {
    var collection = FirebaseFirestore.instance.collection('Cart');
    var doc = collection.doc(docId);
    await doc.update({
      'quantity': quantity,
    });
  }

  void _deleteItem(String docId) {
    FirebaseFirestore.instance.collection('Cart').doc(docId).delete();
  }

  void _clearCart() async {
    var collection = FirebaseFirestore.instance.collection('Cart');
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }

  double calculateTotal(List<BureauModel> items) {
    double total = 0;
    for (var item in items) {
      total += item.prixNormal! * item.quantity;
    }
    return double.parse(total.toStringAsFixed(2)); // Formater avec deux chiffres après la virgule
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon panier'),
      ),
      body: StreamBuilder<QuerySnapshot<BureauModel>>(
        stream: DBService().streamGetData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('Le panier est vide'));
          } else {
            var dataList =
            snapshot.data!.docs.map((doc) => doc.data()).toList();
            double total = calculateTotal(dataList);
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      var item = dataList[index];
                      var docId = snapshot.data!.docs[index].id;
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.network(
                            item.imagePath!,
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                          title: Text(item.design!),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Prix: ${item.prixNormal}'),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            item.quantity--;
                                            _quantityController.text =
                                                item.quantity.toString();
                                            _updateQuantity(
                                                docId, item.quantity);
                                          });
                                        },
                                        child: Icon(Icons.remove,
                                            size: 20, color: Colors.black54),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: SizedBox(
                                          width: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                hintText: "${item.quantity}"),
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              item.quantity = int.parse(value);
                                              _updateQuantity(
                                                  docId, item.quantity);
                                            },
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            item.quantity++;
                                            _quantityController.text =
                                                item.quantity.toString();
                                            _updateQuantity(
                                                docId, item.quantity);
                                          });
                                        },
                                        child: Icon(Icons.add,
                                            size: 20, color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _deleteItem(docId);
                                        dataList.removeAt(index);
                                      });
                                    },
                                    child: Icon(Icons.delete_outline,
                                        size: 24, color: Colors.red),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Total: $total TND',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _clearCart();
                              });
                            },
                            child: Text('Vider le panier'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResumePan(
                                    total: total, // Passer le total comme avant
                                    productList: dataList, // Passer la liste des produits
                                  ),
                                ),
                              );

                            },
                            child: Text('Valider le panier'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,

                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
