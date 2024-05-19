import 'package:company_project/pages/categ/Jouets/listJouet.dart';
import 'package:company_project/pages/categ/beaux-art/listArt.dart';
import 'package:company_project/pages/categ/bureau/listBureau.dart';
import 'package:company_project/pages/categ/cadeau/ListCadeau.dart';
import 'package:company_project/pages/categ/emballage/ListEmb.dart';
import 'package:company_project/pages/categ/info/listInfo.dart';
import 'package:company_project/pages/categ/livres/listBook.dart';
import 'package:company_project/pages/categ/loisirs/listLoisirs.dart';
import 'package:company_project/pages/categ/papeterie/listPapet.dart';
import 'package:flutter/material.dart';


class CategoriesDropDown extends StatefulWidget {
  const CategoriesDropDown({Key? key}) : super(key: key);

  @override
  _CategoriesDropDownState createState() => _CategoriesDropDownState();
}

class _CategoriesDropDownState extends State<CategoriesDropDown> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.category),
      title: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value == "Livres") {
            Navigator.pushNamed(context, ListBook.routeName);
          }
          if (value == "Bureau") {
            Navigator.pushNamed(context, ListBureau.routeName);
          }
          if (value == "Informatique") {
            Navigator.pushNamed(context, ListInfo.routeName);
          }
          if (value == "Papeterie") {
            Navigator.pushNamed(context, ListPapet.routeName);
          }
          if (value == "Emballage") {
            Navigator.pushNamed(context, ListEmb.routeName);
          }
          if (value == "Jouets") {
            Navigator.pushNamed(context, ListJouet.routeName);
          }
          if (value == "Cadeaux et fetes") {
            Navigator.pushNamed(context, ListCadeau.routeName);
          }
          if (value == "Loisirs") {
            Navigator.pushNamed(context, ListLoisirs.routeName);
          }
          if (value == "Beaux-art") {
            Navigator.pushNamed(context, ListArt.routeName);
          }
        },
        hint: Text(
          'Catégories',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        isDense: true,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        items: [
          "Livres",
          "Bureau",
          "Informatique",
          "Papeterie",
          "Emballage",
          "Jouets",
          "Cadeaux et fetes",
          "Beaux-art",
          "Fournitures scolaires",
          "Loisirs",
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
