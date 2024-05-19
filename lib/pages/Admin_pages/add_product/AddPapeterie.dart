import 'package:flutter/material.dart';

class AddPapeterie extends StatefulWidget {
  @override
  _AddPapeterieState createState() => _AddPapeterieState();
}

class _AddPapeterieState extends State<AddPapeterie> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              // Action to close the screen
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
              _buildProductImage(),
              SizedBox(height: 16),
              _buildCategoryDropdown(),
              SizedBox(height: 16),
              _buildTextField(labelText: 'Référence'),
              SizedBox(height: 16),
              _buildTextField(labelText: 'Designation'),
              SizedBox(height: 16),
              _buildTextField(labelText: 'Marque'),
              SizedBox(height: 16),
              _buildTextField(labelText: 'Dimensions'),
              SizedBox(height: 16),
              _buildTextField(labelText: 'Description'),
              SizedBox(height: 16),
              _buildPriceTextField(),
              SizedBox(height: 16),
              _buildAddProductButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Image.asset(
        "assets/images/promo4.jpeg",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Padding(
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
                'Cahier',
                'Papier',
                'Agenda et calendier',
                'Courrier',
                'Papeterie de bureau',
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
    );
  }

  Widget _buildTextField({required String labelText}) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }

  Widget _buildPriceTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Prix',
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildAddProductButton() {
    return Center(
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
    );
  }
}
