
import 'package:company_project/pages/Cart_pages/Cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../profile_screen/pages/profile_view.dart';
import '../pages/HomePage.dart';
import 'categories_drop_down.dart';


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      color: Colors.white,
      child:  Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 80, left: 30),
            alignment: Alignment.topLeft,
            height: MediaQuery.of(context).size.height * 0.24,
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Accueil"),
            onTap: () {Navigator.push(
                    context,
                           MaterialPageRoute(builder: (context) => HomePage()),
                  );},
          ),
          CategoriesDropDown(),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Panier"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
