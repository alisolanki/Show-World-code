import 'dart:convert';

import 'package:LoginPage/Desktop/data_format.dart';
import 'package:LoginPage/providers/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Desktop/categorytiles.dart';
import 'data.dart';
import 'datatiles.dart';
import '../providers/category.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool _pagecategory = true;
  DataProvider _dataProvider;
  List<DataTemplate> _filteredpeople;
  CategoryProvider _categoryProvider;
  List<CategoryTemplate> _categorylist;
  bool _isLoadingCategory = true;
  bool _isLoadingData = true;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<CategoryProvider>(context).fetchCategoryData().then((_) => {
        _isLoadingCategory = false,
      });
      print("category");
      Provider.of<DataProvider>(context).fetchData().then((_) => {
        _isLoadingData = false,
      });
      print("data");
    }
    _categoryProvider = Provider.of<CategoryProvider>(context);
    _categorylist = _categoryProvider.categorylist;
    _dataProvider = Provider.of<DataProvider>(context);
    _filteredpeople = _dataProvider.datalist;
     print("$_filteredpeople");
    _isInit = false;
    super.didChangeDependencies();
  }

  void _togglePage(bool _switchme) {
    setState(
      () {
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
                        ? _categorylist = _categoryProvider.categorylist
                            .where((u) => u.category
                                .toLowerCase()
                                .contains(text.toLowerCase()))
                            .toList()
                        : _filteredpeople = _dataProvider.datalist
                            .where((u) => (u.name
                                    .toLowerCase()
                                    .contains(text.toLowerCase()) ||
                                u.address
                                    .toLowerCase()
                                    .contains(text.toLowerCase()) || 
                                u.subcategory.toLowerCase().contains(text.toLowerCase())))
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
                ? _isLoadingCategory
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount: _categorylist.length,
                        itemBuilder: (ctx, index) {
                          var dataitr = _categorylist[index];
                          return Container(
                            key: ValueKey(dataitr.id),
                            child: CategoryTile(
                                category: dataitr.category,
                                subcategory: dataitr.subcategory),
                          );
                        },
                      )
                : _isLoadingData
                    ? Center(
                        child: CircularProgressIndicator(),
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
