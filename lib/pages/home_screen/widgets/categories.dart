import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final Widget categoryIcon;
  final String categoryTitle;
  final String navName;

  const CategoriesWidget(
      {super.key, required this.categoryIcon, required this.categoryTitle, required this.navName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
              Navigator.pushNamed(context, navName);
          },
          child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(child: categoryIcon)),
        ),
        Text(
          categoryTitle,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        )
      ],
    );
  }
}
