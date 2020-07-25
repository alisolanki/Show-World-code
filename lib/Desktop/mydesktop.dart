import '../providers/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import './datatiles.dart';
import 'data_format.dart';

class MyDesktop extends StatefulWidget {
  final String subcategory;
  MyDesktop({this.subcategory});

  @override
  _MyDesktopState createState() => _MyDesktopState();
}

class _MyDesktopState extends State<MyDesktop> {
  bool _isInit = true;
  DataProvider _dataProvider;
  List<DataTemplate> _filteredpeople;
  List<DataTemplate> _subcategorypeople;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _dataProvider = Provider.of<DataProvider>(context);
      _subcategorypeople = _dataProvider.datalist
          .where((u) => u.subcategory == widget.subcategory)
          .toList();
      _filteredpeople = _subcategorypeople;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Show World',
        ),
        backgroundColor: Color(0xff000000),
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
                onChanged: (text) => setState(() {
                  _filteredpeople = _subcategorypeople
                      .where((u) =>
                          (u.name.toLowerCase().contains(text.toLowerCase())))
                      .toList();
                  print(_filteredpeople);
                }),
              ),
            ),
          ),
          // data region
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: _filteredpeople.length,
              itemBuilder: (ctx, index) {
                var dataitr = _filteredpeople.elementAt(index);
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
