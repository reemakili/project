import 'package:company_project/Services/db_services.dart';
import 'package:company_project/core/models/bureau_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WishList extends StatefulWidget {
  static const String routeName = "wish";
  const WishList({Key? key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  // Fonction pour supprimer un élément de Firestore
  void _deleteItem(String docId) {
    FirebaseFirestore.instance.collection('wishList').doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wish List'),
      ),
      body: StreamBuilder<QuerySnapshot<BureauModel>>(
        stream: DBService().streamGetFavData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            var dataList = snapshot.data!.docs.map((doc) => doc.data()).toList();
            return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                var item = dataList[index];
                var docId = snapshot.data!.docs[index].id; // Obtenir l'ID du document

                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(item.imagePath!, fit: BoxFit.cover, width: 50, height: 50), // URL de l'image
                    title: Text(item.design!), // Design
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price: ${item.prixNormal}'), // Prix
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          _deleteItem(docId);
                          dataList.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.delete_outline, size: 24, color: Colors.red),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
