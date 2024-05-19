import 'package:flutter/material.dart';

class AddJouet extends StatefulWidget {
  @override
  _AddJouetState createState() => _AddJouetState();
}

class _AddJouetState extends State<AddJouet> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon and Text to add image
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Action to add image
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.add,
                        size: 50, // Set icon size
                        color: Colors.blue, // Set icon color
                      ),
                      Text(
                        'Ajouter image',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Dropdown button with a label
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      'Sous-catégorie:',
                      style: TextStyle(fontSize: 18),
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        value: selectedCategory,
                        items: [
                          'Jeux de société',
                          'Jeux éducatifs',
                          'Jeux de construction',
                          'Jeux radiocommandés',
                          'Jeux imitation',
                          'Poupées et peluches',
                          'Robots',
                          'Véhicules',
                        ].map((category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(
                              category,
                              style: TextStyle(fontSize: 14),
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
                        iconSize: 36,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Product publisher input field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Référence',
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
              // Product publisher input field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Dimensions',
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
                  labelText: 'Couleur',
                ),
              ),
              SizedBox(height: 16),
              // Product publisher input field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Prix',
                ),
              ),
              SizedBox(height: 16),
              // Product publisher input field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Prix après remise',
                ),
              ),
              SizedBox(height: 16),
              // Product price input field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
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
