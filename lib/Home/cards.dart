import 'package:flutter/material.dart';

class DirectoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: width * 0.7,
        height: 60,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.purple[900], Colors.purple[800]],
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
              ),
            ]),
        child: FlatButton(
          splashColor: Colors.blueAccent[100],
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.description,
                  color: Colors.white,
                ),
              ),
              Text(
                "Access Directory",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: width * 0.7,
        height: 60,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.indigo[900], Colors.indigo[800]],
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
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
                  color: Colors.white,
                ),
              ),
              Text(
                "List Yourself",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

class BuyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: width * 0.7,
        height: 60,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.blue[900], Colors.blue[700]],
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
              ),
            ]),
        child: FlatButton(
          splashColor: Colors.blueAccent[100],
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
              Text(
                "Buy Full Version",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
