import 'package:company_project/pages/home_screen/pages/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../layout_screen.dart';
import '../regist_Screen/registScreen.dart';
import '../widgets/reusable_widg.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = "AuthScreen";

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/IconLauncher.png',
                width: 200,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(height: 20),
              reusableTextField(
                "Entrer l'adresse email",
                Icons.mail,
                false,
                _emailTextController,
              ),
              const SizedBox(height: 10),
              reusableTextField(
                "Entrer le mot de passe",
                Icons.lock,
                true,
                _passwordTextController,
              ),
              const SizedBox(height: 10),
              signInSignUpButton(
                context,
                true,
                    () {
                  setState(() {
                    _errorMessage = null;
                  });

                  // Vérifier si l'adresse e-mail contient '@'
                  if (!_emailTextController.text.contains('@')) {
                    setState(() {
                      _errorMessage = "L'adresse e-mail doit contenir '@'.";
                    });
                    return;
                  }

                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text,
                  )
                      .then((value) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LayoutView()),
                    );
                  })
                      .catchError((error) {
                    setState(() {
                      _errorMessage = "Erreur, l'adresse mail ou le mot de passe est mal saisi.";
                    });
                  });
                },
              ),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 10),
              signUpOption(context),
            ],
          ),
        ),
      ),
    );
  }
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Vous n'avez pas un compte?",
        style: TextStyle(color: Colors.white70),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegistScreen()),
          );
        },
        child: const Text(
          " S'inscrire",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
