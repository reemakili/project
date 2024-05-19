import 'package:company_project/Services/db_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(

          CupertinoIcons.cart_fill,
          size: 20.0,
        ),
        SizedBox(
          width: 5,
        ),
        Text('ajouter au panier',
        style: TextStyle(
          color: Colors.indigo,
          fontStyle: FontStyle.italic,
        ),),
      ],
    );
  }
}