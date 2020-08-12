import 'package:ShowWorld/listyourself/listpage.dart';
import 'package:ShowWorld/providers/payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './categorypage.dart';
import '../LoginOTP/stores/login_store.dart';
import '../subscriptionpage/subscriptionpage.dart';
import '../auth/auth-api.dart' as auth;

TextStyle drawerfonts =
    TextStyle(color: Color(0xff1b4f72), fontFamily: "roboto");

class DrawerItems extends StatefulWidget {
  @override
  _DrawerItemsState createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  PaymentProvider _payment;
  final _user = auth.user;
  bool _notsubscribed = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _payment = Provider.of<PaymentProvider>(context);
    setState(() {
      _notsubscribed = _payment.subscriptionstatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_user.toString());
    return Container(
      color: Color(0xfff8f8ff),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            onDetailsPressed: null,
            currentAccountPicture: CircleAvatar(
              child: Image.asset("assets/user.png"),
            ),
            accountName: Text(
              "My Account",
              style: TextStyle(
                color: Color(0xfff8f8ff),
                fontWeight: FontWeight.bold,
                fontFamily: "roboto",
              ),
            ),
            accountEmail: Text(
              "${_user.phoneNumber}",
              style: TextStyle(
                color: Color(0xfff8f8ff),
                fontWeight: FontWeight.bold,
                fontFamily: "roboto",
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Color(0xff1b4f72)),
            title: Text(
              'Home',
              style: drawerfonts,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.list, color: Color(0xff1b4f72)),
            title: Text(
              'Categories',
              style: drawerfonts,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CategoryPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.input, color: Color(0xff1b4f72)),
            title: Text(
              'List Yourself',
              style: drawerfonts,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ListPage();
                  },
                ),
              );
            },
          ),
          _notsubscribed
              ? ListTile(
                  leading: Icon(Icons.shopping_cart, color: Color(0xff1b4f72)),
                  title: Text(
                    'Buy Full Version',
                    style: drawerfonts,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SubscriptionPage();
                        },
                      ),
                    ).then((value) => {});
                  },
                )
              : Container(),
          ListTile(
            leading: Icon(Icons.info, color: Color(0xff1b4f72)),
            title: Text(
              'About Us',
              style: drawerfonts,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AboutDialog(
                      applicationName: 'Show World',
                      applicationVersion: '1.0.0',
                      applicationIcon:
                          Icon(Icons.camera, color: Color(0xff1b4f72)),
                      children: <Widget>[
                        Image.asset(
                          'assets/logo.png',
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Color(0xff1b4f72)),
            title: Text(
              'Log Out',
              style: drawerfonts,
            ),
            onTap: () {
              Navigator.pop(context);
              LoginStore().signOut(context);
            },
          ),
        ],
      ),
    );
  }
}
