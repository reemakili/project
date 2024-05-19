import 'package:flutter/material.dart';

class ProductDetailsPopup extends StatelessWidget {
  static const String routeName = "ProductPopUp";
  final String code;
  final String design;
  final String imagePath;
  final String desc;
  final String marque;
  final num prixNormal;

  const ProductDetailsPopup({
    Key? key,
    required this.code,
    required this.design,
    required this.imagePath,
    required this.desc,
    required this.marque,
    required this.prixNormal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(design), // Utilisez le nom du produit comme titre de la popup
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imagePath, // Affichez l'image du produit
              width: 200, // Taille de l'image
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            _buildFieldTitle('Code'),
            Text('$code'), // Affichez le code du produit
            _buildFieldTitle('Prix'),
            Text('$prixNormal'), // Affichez le prix du produit
            _buildFieldTitle('Marque'),
            Text('$marque'), // Affichez la marque du produit
            _buildFieldTitle('Description'),
            Text('$desc'), // Affichez la description du produit
          ],
        ),
      ),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermez la popup lorsque le bouton est cliqué
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300], // Couleur de fond du bouton
              ),
              child: Text(
                'Fermer',
                style: TextStyle(color: Colors.black), // Couleur du texte
              ),
            ),
            SizedBox(height: 10), // Espacement entre les boutons
            ElevatedButton(
              onPressed: () {
                // Logique pour ajouter au panier
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Couleur de fond du bouton
              ),
              child: Text(
                'Ajouter au panier',
                style: TextStyle(color: Colors.white), // Couleur du texte
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFieldTitle(String title) {
    return RichText(
      text: TextSpan(
        text: '$title: ',
        style: TextStyle(
          color: Colors.blue, // Couleur bleue pour le titre
          fontStyle: FontStyle.italic, // Texte en italique
        ),
      ),
    );
  }
// Méthode pour afficher le pop-up des détails du produit
}
