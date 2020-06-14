import 'package:LoginPage/Desktop/categorytiles.dart';
import 'package:LoginPage/Desktop/subcategorytiles.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class SubCategoryPage extends StatelessWidget {
  final String category;
  final List<String> subcategory;
  SubCategoryPage({this.category, this.subcategory});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Show World',
        ),
      ),
      body: Column(
        children: <Widget>[
          //SearchTab
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  suffixIcon: Container(
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
          ),
          // data region
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: subcategory.length,
              itemBuilder: (ctx, index) {
                return SubCategoryTile(category: category,subcategory: subcategory[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}