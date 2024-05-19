import 'package:company_project/pages/Admin_pages/add_product/AddBag.dart';
import 'package:company_project/pages/Admin_pages/add_product/AddBureau.dart';
import 'package:company_project/pages/Admin_pages/add_product/AddInfo.dart';
import 'package:company_project/pages/Admin_pages/add_product/AddJouet.dart';
import 'package:company_project/pages/Admin_pages/add_product/AddLivres.dart';
import 'package:company_project/pages/Admin_pages/add_product/AddPapeterie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter produit'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: (
                ) {
              // Action to close the page
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButtonFormField<String>(
              value: selectedCategory,
              items: [
                'Livres',
                'Jouets',
                'Bagagerie',
                'Bureautique',
                'Informatique',
                'Papeterie',

              ].map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Catégorie',
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: getContent(selectedCategory),
            ),
          ),
        ],
      ),
    );
  }

  Widget getContent(String? category) {
    switch (category) {
      case 'Livres':
        return AddLivres();
      case 'Jouets':
        return AddJouet();
      case 'Bagagerie':
        return AddBag();
      case 'Bureautique':
        return AddBureau();
      case 'Informatique':
        return AddInfo();
      case 'Papeterie':
        return AddPapeterie();
      default:
        return Container(); // Affiche un contenu vide si aucune catégorie sélectionnée
    }
  }
}

