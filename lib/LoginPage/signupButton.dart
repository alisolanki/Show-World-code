import 'package:flutter/material.dart';
import '../Home/homepage.dart';
import '../Animation/FadeAnimation.dart';
import '../listpage/constants.dart';

class SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.5,
      Container(
        height: 50,
        width: 100,
        child: RaisedButton(
          padding: EdgeInsets.all(0),
          onPressed: () {
            loggedIn = true;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ),
            );
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(143, 148, 251, 1),
                  Color.fromRGBO(143, 148, 251, .6),
                ],
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Center(
              child: Text(
                "SignUp",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
