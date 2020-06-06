import 'package:flutter/material.dart';

class AccountHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Account',
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: _width * 0.15,
                  child: Text("P"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Name: ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Phone Number: ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Email: ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
