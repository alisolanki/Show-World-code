import 'package:flutter/material.dart';
import '../Desktop/mydesktop.dart';

class ListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MyDesktop();
            },
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Colors.blue[100],
                Colors.blue[200],
                Colors.blueAccent[200]
              ]),
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 3),
              blurRadius: 5.0,
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
        child: Text(
          'Register',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
