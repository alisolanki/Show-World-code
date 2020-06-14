import 'package:LoginPage/Desktop/data.dart';
import 'package:LoginPage/Desktop/datatiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';

class MyDesktop extends StatelessWidget {
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
          //artist
          category == 'Artist'?
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: ArtistData().artistData['$subcategory'].length,
              itemBuilder: (ctx, index) {
                var dataitr = ArtistData().artistData['$subcategory'][index];
                return DataTile(name: dataitr.name, category: dataitr.category, subcategory:dataitr.subcategory, address: dataitr.address, email:dataitr.email, phonenumber:dataitr.phonenumber);
              },
            ),
          )
          :
          //director
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: DirectorData().directorData['$subcategory'].length,
              itemBuilder: (ctx, index) {
                var dataitr = DirectorData().directorData['$subcategory'][index];
                return DataTile(name: dataitr.name, category: dataitr.category, subcategory:dataitr.subcategory, address: dataitr.address, email:dataitr.email, phonenumber:dataitr.phonenumber);
              },
            ),
          )
          //keep adding for other categories as well if...else if 
        ],
      ),
    );
  }
}
