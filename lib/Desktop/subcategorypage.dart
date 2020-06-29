import 'package:flutter/material.dart';

import '../Desktop/subcategorytiles.dart';

class SubCategoryPage extends StatefulWidget {
  final List subcategory;
  SubCategoryPage({this.subcategory});

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  var _isInit = true;
  List _subcategory = [];
  List _filteredsubcategory = [];

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _subcategory = widget.subcategory;
      _filteredsubcategory = _subcategory;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("${_filteredsubcategory.length}");
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
                onChanged: (text) {
                  setState(() {
                    _filteredsubcategory = _subcategory
                        .where(
                            (u) => u.toLowerCase().contains(text.toLowerCase()))
                        .toList();
                  });
                  print("$_filteredsubcategory");
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
                print("${_filteredsubcategory.length}");
                return Container(
                  key: ValueKey(_filteredsubcategory[index]),
                  child:
                      SubCategoryTile(subcategory: _filteredsubcategory[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
