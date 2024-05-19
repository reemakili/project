import 'package:company_project/Services/db_services.dart';

import 'package:flutter/material.dart';
import '../widgets/reusable_widg.dart';


class ClientForm extends StatelessWidget {
  TextEditingController _nomTextController = TextEditingController();
  TextEditingController _prenomTextController = TextEditingController();
  TextEditingController _addTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            reusableTextField(
              "Entrer le nom  ",
              Icons.person, false, _nomTextController,),
            SizedBox(height: 10),
            reusableTextField(
              "Entrer le prenom  ",
              Icons.person, false, _prenomTextController,),
            SizedBox(height: 10),
            reusableTextField(
              "Entrer l'adresse mail ",
              Icons.mail, false, _emailTextController,),
            SizedBox(height: 10),
            reusableTextField(
              "Entrer le mot de passe ",
              Icons.password, true, _passwordTextController,),
            SizedBox(height: 10),
            signInSignUpButton(
                context, false,
                    () {
                  DBService().registerClient(
                    _nomTextController.text,
                    _prenomTextController.text,
                    _emailTextController.text,
                    _passwordTextController.text,
                    context,
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}
