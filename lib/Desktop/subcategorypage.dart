import 'package:LoginPage/Desktop/subcategorytiles.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class SubCategoryPage extends StatefulWidget {
  final String category;
  final int id;
  SubCategoryPage({this.category, this.id});

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  var _filteredsubcategory;
  @override
  void initState() {
    // TODO: implement initState
    _filteredsubcategory = CategoryData().categorydata[widget.id].subcategory;
    super.initState();
  }

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
                  hintText: "Search Sub-Category",
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                onChanged: (text){
                  setState(() {
                    _filteredsubcategory = CategoryData().categorydata[widget.id].subcategory
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
                return SubCategoryTile(category: widget.category, subcategory: _filteredsubcategory[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}