import 'package:LoginPage/Desktop/data.dart';
import 'package:LoginPage/Desktop/datatiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';

class MyDesktop extends StatelessWidget {
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
              itemCount: ArtistData().artistData.length,
              itemBuilder: (ctx, index) {
                var dataitr = ArtistData().artistData[index];
                return DataTile(name: dataitr.name, category: dataitr.category, address: dataitr.address, email:dataitr.email, phonenumber:dataitr.phonenumber);
              },
            ),
          )
        ],
      ),
    );
  }
}
