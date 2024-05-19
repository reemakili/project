import 'package:flutter/material.dart';


class AddLivres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un livre'),
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
              Image.asset(
                "assets/images/promo4.jpeg",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              // Product title input field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Titre',
                ),
              ),
              SizedBox(height: 16),
              // Product author input field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Auteur',
                ),
              ),
              SizedBox(height: 16),
              // Product publisher input field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Maison d\'édition',
                ),
              ),
              SizedBox(height: 16),
              // Product price input field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Prix',
                ),
                keyboardType: TextInputType.number, // Set keyboard type to number
              ),
              SizedBox(height: 16),
              // Product category input field (you can use a dropdown button or another appropriate input widget)
              TextField(
                decoration: InputDecoration(
                  labelText: 'Catégorie',
                ),
              ),
              SizedBox(height: 16),
              // Product description input field
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
              ),
              SizedBox(height: 32), // Increased spacing for the button
              // Add Product button
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
                    'Ajouter le livre',
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

class AddProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement your custom widget logic here
    return Container(
      // Your widget content
    );
  }
}



