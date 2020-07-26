import 'package:flutter/material.dart';

import './mydesktop.dart';

class SubCategoryTile extends StatelessWidget {
  final String subcategory;
  SubCategoryTile({this.subcategory});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            "$subcategory",
            style: TextStyle(
              fontFamily: "roboto",
              fontWeight: FontWeight.bold,
              color: Color(0xff5499c7),
            ),
          ),
        ),
        trailing: Icon(Icons.arrow_right),
        dense: true,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MyDesktop(subcategory: subcategory);
              },
            ),
          );
        },
      ),
    );
  }
}
