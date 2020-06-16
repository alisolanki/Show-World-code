import 'package:flutter/material.dart';

import '../Desktop/categorytiles.dart';
import 'data.dart';
import 'datatiles.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool _pagecategory = true;
  List _filteredpeople = CategoryData().categorydata;

  void _togglePage(bool _switchme) {
    setState(
      () {
        _pagecategory
            ? _filteredpeople = Data().data
            : _filteredpeople = CategoryData().categorydata;
        _pagecategory = _switchme;
      },
    );
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
                  hintText: _pagecategory ? "Search Category" : "Search People",
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                onChanged: (text) {
                  setState(() {
                    _pagecategory
                        ? _filteredpeople = CategoryData()
                            .categorydata
                            .where((u) => u.category
                                .toLowerCase()
                                .contains(text.toLowerCase()))
                            .toList()
                        : _filteredpeople = Data()
                            .data
                            .where((u) => (u.name
                                    .toLowerCase()
                                    .contains(text.toLowerCase()) ||
                                u.phonenumber
                                    .toLowerCase()
                                    .contains(text.toLowerCase()) ||
                                u.address
                                    .toLowerCase()
                                    .contains(text.toLowerCase())))
                            .toList();
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  color: _pagecategory ? Colors.blue : Colors.transparent,
                  child: Text(
                    "Category",
                    style: TextStyle(
                      color: _pagecategory ? Colors.white : Colors.blue,
                    ),
                  ),
                  onPressed: () {
                    _togglePage(true);
                  },
                ),
                FlatButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  color: _pagecategory ? Colors.transparent : Colors.blue,
                  child: Text(
                    "All People",
                    style: TextStyle(
                      color: _pagecategory ? Colors.blue : Colors.white,
                    ),
                  ),
                  onPressed: () {
                    _togglePage(false);
                  },
                ),
              ],
            ),
          ),
          // data region
          Expanded(
            child: _pagecategory
                ? ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: _filteredpeople.length,
                    itemBuilder: (ctx, index) {
                      var dataitr = _filteredpeople[index];
                      return Container(
                        key: ValueKey(_filteredpeople[index].id),
                        child: CategoryTile(
                          category: dataitr.category,
                          subcategory: dataitr.subcategory),
                      );
                    },
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: _filteredpeople.length,
                    itemBuilder: (ctx, index) {
                      var dataitr = _filteredpeople[index];
                      return Container(
                        key: ValueKey(_filteredpeople[index].id),
                        child: DataTile(
                            name: dataitr.name,
                            category: dataitr.category,
                            subcategory: dataitr.subcategory,
                            address: dataitr.address,
                            email: dataitr.email,
                            phonenumber: dataitr.phonenumber),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
