import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Desktop/drawer.dart';
import './advtCard.dart';
import './cards.dart';
import '../LoginOTP/stores/login_store.dart';
import '../providers/category.dart';
import '../providers/data.dart';
import '../auth/auth-api.dart' as auth;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isInit = true;
  FirebaseUser _user;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        auth.geturls();
      });
      FirebaseAuth.instance.currentUser().then(
            (value) => setState(() {
              _user = value;
            }),
          );
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // print('uid: ' + _user.uid);
    // _user.getIdToken().then((value) => print('Token: ' + value.token));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DataProvider()),
        ChangeNotifierProvider.value(value: CategoryProvider()),
        Provider.value(value: LoginStore()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: Text(
              'Show World',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          drawer: Drawer(
            elevation: 5,
            child: DrawerItems(),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: AdvertisementCardTop(),
                ),
                Expanded(
                  child: DirectoryCard(),
                ),
                Expanded(
                  child: ListCard(),
                ),
                Expanded(
                  child: BuyCard(),
                ),
                Expanded(
                  flex: 2,
                  child: AdvertisementCardBottom(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
