import 'dart:async';

import 'package:flutter/material.dart';
import '../authentication/auth_screen/authScreen.dart';
class SplashScreen extends StatefulWidget{

  static const String splashScreen = "/";

  const SplashScreen ({super.key});


  @override
  State<SplashScreen> createState()=>_SplashScreenState();

}
class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    Timer(const Duration(seconds: 4),(){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AuthScreen()));
      },);
    super.initState();
}
  @override
    Widget build(BuildContext context){
    return  Container(
      alignment: Alignment.center,
      color: Colors.indigo[900],
      child: Image.asset("assets/images/IconLauncher.png"),
    );
  }
  }