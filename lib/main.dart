
import 'package:company_project/pages/WishList/WishList.dart';
import 'package:company_project/pages/categ/Jouets/listJouet.dart';
import 'package:company_project/pages/categ/bagagerie/listbag.dart';
import 'package:company_project/pages/categ/beaux-art/listArt.dart';
import 'package:company_project/pages/categ/bureau/listBureau.dart';
import 'package:company_project/pages/categ/cadeau/ListCadeau.dart';
import 'package:company_project/pages/categ/emballage/ListEmb.dart';
import 'package:company_project/pages/categ/four_scol/listFour.dart';
import 'package:company_project/pages/categ/info/listInfo.dart';
import 'package:company_project/pages/categ/livres/listBook.dart';
import 'package:company_project/pages/categ/loisirs/listLoisirs.dart';
import 'package:company_project/pages/categ/papeterie/listPapet.dart';
import 'package:company_project/pages/layout_screen.dart';
import 'package:company_project/pages/pop_ups/detailsProduct_pop.dart';
import 'package:company_project/pages/product_details_screen/pages/product_screen_details.dart';
import 'package:company_project/pages/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/config/theme_manager.dart';
import 'firebase_options.dart';
import 'pages/authentication/auth_screen/authScreen.dart';
import 'pages/authentication/regist_Screen/registScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.themeStyle,
      initialRoute: LayoutView.routeName, // Définissez la route initiale sur AuthScreen
      routes: {
        AuthScreen.routeName: (context) => AuthScreen(), // Associez le nom de la route à la fonction de création de widget
        SplashScreen.splashScreen: (context) => const SplashScreen(),
        LayoutView.routeName: (context) => const LayoutView(),
        RegistScreen.routeName: (context)=>RegistScreen(),
        ListBureau.routeName: (context) =>  ListBureau(),
        ListBag.routeName:(context)=> ListBag(),
        ListEmb.routeName:(context)=>const ListEmb(),
        ListArt.routeName:(context)=>const ListArt(),
        ListCadeau.routeName:(context)=>ListCadeau(),
        ListBook.routeName:(context)=>const ListBook(),
        ListFour.routeName:(context)=>const ListFour(),
        ListInfo.routeName:(context)=> ListInfo(),
        ListJouet.routeName:(context)=> ListJouet(),
        ListLoisirs.routeName:(context)=>const ListLoisirs(),
        ListPapet.routeName:(context)=>const ListPapet(),
        WishList.routeName :(context)=> const WishList()

      },
    );
  }
}
