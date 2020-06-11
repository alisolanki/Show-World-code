import 'package:flutter/material.dart';

import './passwordField.dart';
import '../Animation/FadeAnimation.dart';

class VerificationFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.5,
      Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 20.0,
              offset: Offset(0, 10),
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[100],
                  ),
                ),
              ),
              child: TextField(
                cursorColor: Colors.purpleAccent,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Email or Phone number",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: PasswordField(),
            )
          ],
        ),
      ),
    );
  }
}
