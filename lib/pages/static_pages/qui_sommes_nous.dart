import 'package:flutter/material.dart';

class QuiSommes extends StatelessWidget {
  const QuiSommes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo[700],
        title: const Text(
          "QUI SOMMES NOUS?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Background image with rounded bottom-right corner
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(150.0),
              bottomLeft: Radius.circular(20.0),
            ),
            child: Image.asset(
              "assets/images/back1.jpg",
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),

          // Titres et sous-titres
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Titre de la société avec icône
                Row(
                  children: [
                    Icon(
                      Icons.business,
                      color: Colors.black,
                    ),
                    SizedBox(width: 8), // Espacement entre l'icône et le texte
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nom de la société:",
                          style: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Scolaris",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
