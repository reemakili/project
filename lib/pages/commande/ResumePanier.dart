import 'package:flutter/material.dart';

class ResumePan extends StatefulWidget {
  final double total;
  final List<dynamic> productList;

  const ResumePan({Key? key, required this.total, required this.productList}) : super(key: key);

  @override
  State<ResumePan> createState() => _ResumePanState();
}


class _ResumePanState extends State<ResumePan> {
  bool _cashOnDelivery = false;
  bool _onlinePayment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Résumé de panier',
        style: TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.italic,
        color: Colors.white
    )
      ),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total des produits:',
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                  ),
                ),
                Text(
                  '${widget.total} TND',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Frais de livraison: 0 TND',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Colors.black26,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Mes produits:',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.deepOrange,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.productList.length,
              itemBuilder: (context, index) {
                var product = widget.productList[index];
                return ListTile(
                  title: Text(product.design),
                  subtitle: Text('Prix: ${product.prixNormal} TND | Quantité: ${product.quantity}'),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              'Mode de livraison',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            CheckboxListTile(
              title: Text('Paiement en espèce à la livraison'),
              value: _cashOnDelivery,
              onChanged: (bool? value) {
                setState(() {
                  _cashOnDelivery = value ?? false;
                  if (_cashOnDelivery) {
                    _onlinePayment = false;
                  }
                });
              },
            ),
            CheckboxListTile(
              title: Text('Paiement en ligne'),
              value: _onlinePayment,
              onChanged: (bool? value) {
                setState(() {
                  _onlinePayment = value ?? false;
                  if (_onlinePayment) {
                    _cashOnDelivery = false;
                  }
                });
              },
            ),
            SizedBox(height: 20),

// Centrer le bouton
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Action à effectuer lors de l'appui sur le bouton
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Couleur d'arrière-plan du bouton
                ),
                child: Text(
                  'Valider commande',
                  style: TextStyle(
                    color: Colors.white, // Couleur du texte du bouton
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
