import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/payment.dart';
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
        ChangeNotifierProvider.value(value: PaymentProvider()),
        Provider.value(value: LoginStore()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 2,
              titleSpacing: 1,
              centerTitle: true,
              title: Text(
                'SHOW WORLD',
                style: TextStyle(
                  fontFamily: "roboto",
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  fontSize: 25,
                  color: Colors.purple[800],
                ),
              ),
              iconTheme: IconThemeData(color: Colors.purple[900]),
            ),
          ),
          drawer: Drawer(
            elevation: 5,
            child: DrawerItems(),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 8),
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
