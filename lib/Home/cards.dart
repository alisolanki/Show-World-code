import 'package:flutter/cupertino.dart';

import '../Desktop/categorypage.dart';
import 'package:flutter/material.dart';
import '../subscriptionpage/subscriptionpage.dart';
import '../listpage/listpage.dart';

class DirectoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      highlightColor: Colors.purple[400],
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
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.symmetric(
              vertical: BorderSide.none,
              horizontal: BorderSide.none,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purple[100],
                blurRadius: 6,
                offset: Offset(0, 2),
                spreadRadius: 3,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ),
              child: Icon(
                Icons.description,
                color: Colors.purple,
                size: 25,
              ),
            ),
            Text(
              "Access Directory",
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 20,
                  // fontFamily: "roboto",
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      highlightColor: Colors.indigo[400],
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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.indigo[100],
                blurRadius: 6,
                offset: Offset(0, 2),
                spreadRadius: 3,
              ),
            ]),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ),
              child: Icon(
                Icons.input,
                color: Colors.indigo,
              ),
            ),
            Text(
              "List Yourself",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                // fontFamily: "roboto",
                color: Colors.indigo,
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

class BuyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      highlightColor: Colors.blue[400],
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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.blue[100],
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ]),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.blue,
              ),
            ),
            Text(
              "Buy Full Version",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                // fontFamily: "roboto",
                color: Colors.blue,
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
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
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.indigo[800],
              blurRadius: 6,
              offset: Offset(0, 2),
              spreadRadius: 3,
            ),
          ]),
      child: FlatButton(
        splashColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                right: 20.0,
              ),
              child: Icon(
                Icons.input,
                color: Colors.indigo[800],
              ),
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
