import 'package:flutter/material.dart';

class DirectoryCard extends StatelessWidget {
  final double _width;
  final double _height;
  DirectoryCard(this._height,this._width);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Flexible(
        child: Container(
          width: _width * 0.9,
          height: _height * 0.13,
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
                  blurRadius: 2.0,
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
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  final double _width;
  final double _height;
  ListCard(this._height,this._width);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: _width * 0.9,
        height: _height * 0.13,
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
                blurRadius: 2.0,
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
  final double _width;
  final double _height;
  BuyCard(this._height,this._width);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: _width * 0.9,
        height: _height * 0.13,
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
                blurRadius: 2.0,
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
