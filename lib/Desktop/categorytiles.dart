import 'package:flutter/material.dart';

import '../Desktop/subcategorypage.dart';

class CategoryTile extends StatelessWidget {
  final String category;
  final List subcategory;
  CategoryTile({this.category, this.subcategory});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[900],
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            "$category",
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
                return SubCategoryPage(subcategory: subcategory);
              },
            ),
          );
        },
      ),
    );
  }
}
