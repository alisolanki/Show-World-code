import 'package:LoginPage/Home/homepage.dart';
import 'package:LoginPage/providers/data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Login2/login_screen.dart';
import './providers/category.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider()),
        ChangeNotifierProvider<CategoryProvider>(
            create: (_) => CategoryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
