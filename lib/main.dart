import 'package:flutter/material.dart';
import 'Login2/forgotpassword.dart';
import 'LoginPage/loginPage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ForgotPasswordPage();
  }
}
