import 'package:flutter/material.dart';

class AddBag extends StatefulWidget {
  @override
  _AddBagState createState() => _AddBagState();
}

class _AddBagState extends State<AddBag> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {

            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image (you can replace this with your own image widget)
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/promo4.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              // Dropdown button with a label
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      'Sous-catégorie: ',
                      style: TextStyle(fontSize: 18),
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        value: selectedCategory,
                        items: [
                          'Cartable',
                          'Chariot',
                          'Trousse',
                          'Porte monnaie',
                          'Serviettes',
                          'Sac PC',
                        ].map((category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(
                              category,
                              style: TextStyle(fontSize: 14), // Réduire la taille de la police
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                        icon: Icon(Icons.arrow_drop_down),
                        isExpanded: true,
                        iconSize: 36, // Augmenter la taille de l'icône de flèche
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Product title input field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Designation',
                ),
              ),
              SizedBox(height: 16),
              // Product author input field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Marque',
                ),
              ),
              SizedBox(height: 16),
              // Product publisher input field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Ref',
                ),
              ),
              SizedBox(height: 16),
              // Product publisher input field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Couleur',
                ),
              ),
              SizedBox(height: 16),
              // Product publisher input field
              TextField(
                decoration: InputDecoration(
                  labelText: 'prix',
                ),
              ),
              SizedBox(height: 16),
              // Product price input field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                keyboardType: TextInputType.number, // Set keyboard type to number
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Action to add the product
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue, // Set text color to white
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16), // Set button padding
                  ),
                  child: Text(
                    'Ajouter le produit',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
