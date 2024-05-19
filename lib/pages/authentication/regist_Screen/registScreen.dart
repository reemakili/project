import 'package:flutter/material.dart';

import '../widgets/reusable_widg.dart';
import 'client_form.dart';
import 'entreprise_form.dart';


class RegistScreen extends StatefulWidget {
  static const String routeName = "RegistScreen";
  @override
  State<RegistScreen> createState()=>_RegistScreenState();}
class _RegistScreenState extends State<RegistScreen>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        title: Text(
          'Inscription',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent, // Rendre l'arrière-plan de l'appBar transparent
        elevation: 0, // Supprimer l'ombre de l'appBar
        centerTitle: true, // Centrer le titre
      ),
      body: DefaultTabController(
        length: 2,

        child: Column(
          children: [
            SizedBox(height: 10), // Ajouter un espacement
            Center(
              child: Container(
                width: 250, // Largeur du conteneur
                child: TabBar(
                  labelColor: Colors.white, // Couleur du texte de l'onglet actif
                  unselectedLabelColor: Colors.grey[400], // Couleur du texte de l'onglet non sélectionné
                  tabs: [
                    Tab(
                      text: 'Entreprise',
                    ),
                    Tab(
                      text: 'Client',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  EntreForm(),
                  ClientForm(),
                ],


              ),


            ),
          ],
        ),

      ),


    );
  }
}





