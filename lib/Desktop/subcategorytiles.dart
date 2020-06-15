import 'package:LoginPage/Desktop/datatiles.dart';
import 'package:LoginPage/Desktop/subcategorypage.dart';
import 'package:flutter/material.dart';

import './mydesktop.dart';

class SubCategoryTile extends StatelessWidget {
  final String category, subcategory;
  SubCategoryTile({this.category, this.subcategory});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[800],
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            "$subcategory",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        trailing:
            Icon(Icons.arrow_right),
        dense: true,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MyDesktop(category:category, subcategory: subcategory);
              },
            ),
          );
        },
      ),
    );
  }
}