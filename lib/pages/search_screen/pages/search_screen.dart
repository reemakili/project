import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rechercher",
            style: TextStyle(
                color: Colors.black)
        ), // Texte "Rechercher" en noir
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.grey[200], // Couleur de fond grise
              borderRadius: BorderRadius.circular(18.0), // Bords arrondis
            ),
            child: Row(
              children: [
                Icon(Icons.search_rounded, color: Colors.black), // Icône de recherche en noir
                SizedBox(width: 8), // Espacement entre l'icône et le champ de texte
                Expanded(
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        searchController.text = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Rechercher des articles", // Texte "Rechercher des articles" en gris clair
                      hintStyle: TextStyle(color: Colors.grey), // Style du texte d'indice en gris clair
                      border: InputBorder.none, // Supprimer les bordures
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (searchController.text.isEmpty)
            Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height * 0.38,
              child: Text(
                "No Search yet",
                style:TextStyle(
                  color:Colors.grey[400],
                )
              ),
            ),
          if (searchController.text.isNotEmpty)
            Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height * 0.38,
              child: Text(
                "Products",
              ),
            ),
        ],
      ),
    );
  }
}
