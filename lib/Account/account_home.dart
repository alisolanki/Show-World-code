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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(top: _width * 0.15),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      margin: EdgeInsets.only(top: _width * 0.2),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Name: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
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
    );
  }
}
