import 'package:flutter/material.dart';
import '../Desktop/mydesktop.dart';

class ListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        color: Colors.blue[900],
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: (_width * 0.1)),
          child: Text(
            'Register',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
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
      ),
    );
  }
}
