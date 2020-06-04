import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cards.dart';

class MyDesktop extends StatefulWidget {
  @override
  _MyDesktopState createState() => _MyDesktopState();
}

class _MyDesktopState extends State<MyDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Show World',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          FlatButton(onPressed: () {}, child: Icon(Icons.menu)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //SearchTab
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                //color: Colors.purple.shade100,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              margin: EdgeInsets.all(10.0),
              //padding: EdgeInsets.only(left: 20.0),
              height: 100.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.black38,
                        decoration: InputDecoration(hintText: 'Search'),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.search,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // data region
            Center(
              child: Column(
                children: <Widget>[
                  //Artists
                  ArtistCard(),
                  //Directors
                  DirectorCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}