import 'package:company_project/pages/Admin_pages/add_product/AddProduct.dart';
import 'package:company_project/pages/static_pages/qui_sommes_nous.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/icons8-utilisateur-40.png'),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nom d\'utilisateur',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'utilisateur@email.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuiSommes()),
                );
              },
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.blue),
                title: Text('Qui sommes nous?'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.people, color: Colors.green),
              title: Text('Nos partenaires'),
              onTap: () {
                // Action lorsque l'élément est cliqué
              },
            ),

            ListTile(
              leading: Icon(Icons.mail, color: Colors.red),
              title: Text('Contacter-nous'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Colors.purple),
              title: Text('Liste des souhaits'),
              onTap: () {
                // Action lorsque l'élément est cliqué
              },
            ),
            SizedBox(height: 20), // Espacement entre la liste et le bouton
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Action lorsque le bouton est cliqué
                },
                child: Text('Déconnexion'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
