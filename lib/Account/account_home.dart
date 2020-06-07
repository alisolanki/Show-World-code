import 'package:flutter/cupertino.dart';
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: _width * 0.15),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: _width * 0.15),
                    child: Card(
                      color: Colors.blue[100],
                      elevation: 5,
                      child: Container(
                        margin: EdgeInsets.only(top: _width * 0.25),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Name: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    'hiisinsj isdoin',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Phone Number : ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '+91783990209',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                    height: 20.0,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Occupation : ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Director, Producer',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Email : ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'timepass@gmail.com',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                    height: 20.0,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Duration : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '2 years',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //Profile Picture
                  SizedBox(
                    width: _width * 0.35,
                    height: _width * 0.35,
                    child: FloatingActionButton(
                      shape: CircleBorder(
                        //TODO:remove the border once checked the border is just for verification
                        side: BorderSide(
                          color: Colors.black,
                          width: 5,
                          style: BorderStyle.solid,
                        ),
                      ),
                      highlightElevation: 10.0,
                      hoverElevation: 10.0,
                      child: CircleAvatar(
                        radius: _width,
                        child: Text("P"),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
