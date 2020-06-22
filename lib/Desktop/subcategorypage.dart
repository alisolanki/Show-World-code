import 'data.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Desktop/subcategorytiles.dart';
import '../providers/category.dart';

class SubCategoryPage extends StatefulWidget {
  final List subcategory;
  SubCategoryPage({this.subcategory});

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  var _filteredsubcategory;
  var _isInit = true;

  @override
  Widget build(BuildContext context) {
    _filteredsubcategory = widget.subcategory;
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
                  hintText: "Search Sub-Category",
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                onChanged: (text){
                  setState(() {
                    _filteredsubcategory = _filteredsubcategory['']
                            .where((u) => u
                                .toLowerCase()
                                .contains(text.toLowerCase()))
                            .toList();
                  });
                },
              ),
            ),
          ),
          // data region
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: _filteredsubcategory.length,
              itemBuilder: (ctx, index) {
                return SubCategoryTile(subcategory: _filteredsubcategory[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}