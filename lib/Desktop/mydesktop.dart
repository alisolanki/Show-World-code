import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cards.dart';
import 'drawer.dart';

class MyDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Show World',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 5,
        child: DrawerItems(),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            Column(
              children: <Widget>[
                //Artists
                ArtistCard(),
                //Directors
                DirectorCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
