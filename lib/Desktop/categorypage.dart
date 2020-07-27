import 'dart:convert';

import 'package:ShowWorld/widgets/round_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Desktop/data_format.dart';
import '../providers/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Desktop/categorytiles.dart';
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
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    print("_isInit = $_isInit");
    if (_isInit) {
      Provider.of<CategoryProvider>(context)
          .fetchCategoryData()
          .then((check) => {
                setState(() {
                  _isLoadingCategory = check;
                }),
                print("Is loading Category: $_isLoadingCategory"),
              });
      Provider.of<DataProvider>(context).fetchData().then((check) => {
            setState(() {
              _isLoadingData = check;
            }),
            print("Is loading Data: $_isLoadingData"),
          });
    }
    _categoryProvider = Provider.of<CategoryProvider>(context);
    _categorylist = _categoryProvider.categorylist;
    _dataProvider = Provider.of<DataProvider>(context, listen: true);
    _filteredpeople = _dataProvider.datalist;
    print("_filteredpeople = $_filteredpeople");
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
    // Provider.of<DataProvider>(context).subcription
    //     ? Scaffold.of(context).showSnackBar(
    //         SnackBar(
    //           content: Text("Subscribed"),
    //         ),
    //       )
    //     : Scaffold.of(context).showSnackBar(
    //         SnackBar(
    //           content: Text("Subscribe to get the full version"),
    //         ),
    //       );
    return Scaffold(
      backgroundColor: Color(0xffd4e6f1),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        backgroundColor: Color(0xff1b4f72),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 20,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
//      appBar: PreferredSize(
//        preferredSize: Size(double.infinity, 60),
//        child: AppBar(
//          backgroundColor: Colors.white,
//          elevation: 2,
//          titleSpacing: 1,
//          centerTitle: true,
//          title: Text(
//            'SHOW WORLD',
//            style: TextStyle(
//              fontFamily: "roboto",
//              fontWeight: FontWeight.w600,
//              letterSpacing: 2,
//              fontSize: 25,
//              color: Colors.purple[800],
//            ),
//          ),
//          iconTheme: IconThemeData(color: Colors.purple[800]),
//        ),
//      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              //SearchTab
              Card(
                shadowColor: Colors.blue[300],
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                elevation: 4,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    cursorColor: Color(0xff5499c7),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Color(0xdd1a5276),
                      fontFamily: "roboto",
                    ),
                    decoration: InputDecoration(
                      focusColor: Colors.black,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff5499c7),
                          width: 2,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff5499c7),
                          width: 2,
                        ),
                      ),
                      suffixIcon: Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Color(0xff5499c7),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      hintText:
                          _pagecategory ? "Search Category" : "Search People",
                      hintStyle: TextStyle(
                        fontFamily: "roboto",
                        color: Color(0x881a5276),
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
                                    u.subcategory
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
                      color: _pagecategory
                          ? Color(0xff5499c7)
                          : Colors.transparent,
                      child: Text(
                        "Category",
                        style: TextStyle(
                          fontFamily: "roboto",
                          color:
                              _pagecategory ? Colors.white : Color(0xff5499c7),
                        ),
                      ),
                      onPressed: () {
                        _togglePage(true);
                      },
                    ),
                    FlatButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      color: _pagecategory
                          ? Colors.transparent
                          : Color(0xff5499c7),
                      child: Text(
                        "All People",
                        style: TextStyle(
                          fontFamily: "roboto",
                          color:
                              _pagecategory ? Color(0xff5499c7) : Colors.white,
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
        ),
      ),
    );
  }
}
