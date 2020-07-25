import 'package:flutter/cupertino.dart';

import '../Desktop/categorypage.dart';
import 'package:flutter/material.dart';
import '../subscriptionpage/subscriptionpage.dart';
import '../listpage/listpage.dart';

class DirectoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
//            gradient: LinearGradient(
//              begin: Alignment.bottomCenter,
//              end: Alignment.topCenter,
//              colors: [Colors.purple[900], Colors.purple[800]],
//            ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.symmetric(
              vertical: BorderSide.none, horizontal: BorderSide.none),
          boxShadow: [
            BoxShadow(
                color: Colors.purple[100],
                blurRadius: 0.5,
                offset: Offset(0, 2)),
          ]),
      child: FlatButton(
        splashColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.description,
                color: Colors.purple[900],
                size: 25,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Access Directory",
              style: TextStyle(
                  color: Colors.purple[900],
                  fontSize: 20,
                  fontFamily: "roboto",
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CategoryPage();
              },
            ),
          );
        },
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//        width: _width * 0.9,
//        height: _height * 0.13,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.indigo[100],
              blurRadius: 0.5,
              offset: Offset(0, 2),
            ),
          ]),
      child: FlatButton(
        splashColor: Colors.blueAccent[100],
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.input,
                color: Colors.indigo[800],
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "List Yourself",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: "roboto",
                color: Colors.indigo[800],
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ListPage();
              },
            ),
          );
        },
      ),
    );
  }
}

class UnListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: EdgeInsets.all(10),
//        width: _width * 0.9,
//        height: _height * 0.13,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.indigo[100],
              blurRadius: 0.5,
              offset: Offset(0, 2),
            ),
          ]),
      child: FlatButton(
        splashColor: Colors.white,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.input,
                color: Colors.indigo[800],
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Remove Yourself",
              style: TextStyle(
                color: Colors.indigo[800],
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}

class BuyCard extends StatelessWidget {
//  final double _width;
//  final double _height;
//  BuyCard(this._height,this._width);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: EdgeInsets.all(10),
//        width: _width * 0.9,
//        height: _height * 0.13,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color: Colors.blue[100], blurRadius: 0.5, offset: Offset(0, 2)),
          ]),
      child: FlatButton(
        splashColor: Colors.blueAccent[100],
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Buy Full Version",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: "roboto",
                color: Colors.blue[900],
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SubscriptionPage();
              },
            ),
          );
        },
      ),
    );
  }
}
