import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './data.dart';
import './datatiles.dart';

class MyDesktop extends StatelessWidget{
  final String subcategory, category;
  MyDesktop({this.category, this.subcategory});

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
              itemCount: Data()
                  .data
                  .where((element) => (element.category == category &&
                      element.subcategory == subcategory))
                  .length,
              itemBuilder: (ctx, index) {
                var dataitr = Data().data.where((element) => element.category == category &&
                      element.subcategory == subcategory).elementAt(index);
                return DataTile(
                    name: dataitr.name,
                    category: dataitr.category,
                    subcategory: dataitr.subcategory,
                    address: dataitr.address,
                    email: dataitr.email,
                    phonenumber: dataitr.phonenumber);
              },
            ),
          )
        ],
      ),
    );
  }
}
