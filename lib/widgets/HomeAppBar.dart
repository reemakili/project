import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          // Wrap the first logo with Flexible or Expanded
          Flexible(
            child: Image.asset(
              "assets/logo1.png",
              height: 40, // Adjust height as needed
              width: 40, // Adjust width as needed
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.business,
              size: 25,
              color: Color(0xFF4C53A5),
            ),
          ),
          // Wrap the second logo with Flexible or Expanded
          Flexible(
            child: Image.asset(
              "assets/logo2.png",
              height: 40, // Adjust height as needed
              width: 40, // Adjust width as needed
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.business,
              size: 25,
              color: Colors.red,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Scolaris Office City",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.sort,
            size: 30,
            color: Color(0xFF4C53A5),
          ),
        ],
      ),
    );
  }
}
