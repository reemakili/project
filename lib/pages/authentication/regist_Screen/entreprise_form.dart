import 'package:company_project/Services/db_services.dart';
import 'package:company_project/pages/home_screen/pages/HomePage.dart';
import 'package:flutter/material.dart';
import '../widgets/reusable_widg.dart';

class EntreForm extends StatelessWidget {
  final TextEditingController _nomTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _regsitreTextController = TextEditingController();
  final TextEditingController _matriculeTextController = TextEditingController();
  final TextEditingController _addLocTextController = TextEditingController();

  final ValueNotifier<String?> _errorMessageNotifier = ValueNotifier<String?>(null);

  void _registerEntreprise(BuildContext context) async {
    _errorMessageNotifier.value = null;

    final String email = _emailTextController.text;
    final String password = _passwordTextController.text;
    final String nom = _nomTextController.text;
    final String addLoc = _addLocTextController.text;
    final String registre = _regsitreTextController.text;
    final String matricule = _matriculeTextController.text;

    if (!email.contains('@')) {
      _errorMessageNotifier.value = "L'adresse e-mail doit contenir '@'.";
      return;
    }

    if (nom.isEmpty || password.isEmpty || addLoc.isEmpty || registre.isEmpty || matricule.isEmpty) {
      _errorMessageNotifier.value = "Tous les champs doivent être remplis.";
      return;
    }

    if (matricule.length != 8 || !RegExp(r'^[0-9]{8}$').hasMatch(matricule)) {
      _errorMessageNotifier.value = "La matricule fiscale doit être composée de 8 chiffres.";
      return;
    }

    if (registre != matricule.substring(0, 4)) {
      _errorMessageNotifier.value = "Le registre commercial doit correspondre aux quatre premiers chiffres de la matricule fiscale.";
      return;
    }

    try {
      await DBService().registerEntreprise(
        nom,
        email,
        addLoc,
        password,
        registre,
        matricule,
      );

      // Affiche un message de succès
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Inscription réussie !')),
      );

      // Navigue vers la HomePage
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false,
      );
    } catch (error) {
      _errorMessageNotifier.value = "Erreur lors de l'enregistrement de l'entreprise : $error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              reusableTextField(
                "Entrer le nom de la société",
                Icons.person,
                false,
                _nomTextController,
              ),
              SizedBox(height: 10),
              reusableTextField(
                "Entrer l'adresse locale",
                Icons.maps_home_work_outlined,
                false,
                _addLocTextController,
              ),
              SizedBox(height: 10),
              reusableTextField(
                "Entrer l'adresse mail",
                Icons.mail,
                false,
                _emailTextController,
              ),
              SizedBox(height: 10),
              reusableTextField(
                "Entrer le mot de passe",
                Icons.password,
                true,
                _passwordTextController,
              ),
              SizedBox(height: 10),
              reusableTextField(
                "Entrer le registre commerce",
                Icons.numbers,
                false,
                _regsitreTextController,
              ),
              SizedBox(height: 10),
              reusableTextField(
                "Entrer la matricule fiscale",
                Icons.numbers,
                false,
                _matriculeTextController,
              ),
              SizedBox(height: 20),
              signInSignUpButton(
                context,
                false,
                    () => _registerEntreprise(context),
              ),
              ValueListenableBuilder<String?>(
                valueListenable: _errorMessageNotifier,
                builder: (context, errorMessage, child) {
                  if (errorMessage == null) return SizedBox.shrink();
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
