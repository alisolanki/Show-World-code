import 'package:ShowWorld/LoginOTP/stores/login_store.dart';
import 'package:flutter/material.dart';

import './categorypage.dart';
import '../Login2/login_screen.dart';
import '../Account/account_home.dart';
import '../subscriptionpage/subscriptionpage.dart';
import '../auth/auth-api.dart' as auth;

TextStyle drawerfonts =
    TextStyle(color: Color(0xff1b4f72), fontFamily: "roboto");

class DrawerItems extends StatelessWidget {
  final _user = auth.user;
  final _loggedIn = LoginStore().firebaseUser != null;

  @override
  Widget build(BuildContext context) {
    print(_user.toString());
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        _loggedIn
            ? UserAccountsDrawerHeader(
                onDetailsPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AccountHomePage();
                      },
                    ),
                  );
                },
                arrowColor: Colors.grey[400],
                decoration: BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.rectangle),
                currentAccountPicture: CircleAvatar(
                  child: Image.asset("assets/user.png"),
                ),
                accountName: Text(
                  "${_user.displayName}",
                  style: TextStyle(
                      color: Color(0xff1b4f72),
                      fontWeight: FontWeight.bold,
                      fontFamily: "roboto"),
                ),
                accountEmail: Text(
                  "${_user.phoneNumber}",
                  style: TextStyle(
                      color: Color(0xff1b4f72),
                      fontWeight: FontWeight.bold,
                      fontFamily: "roboto"),
                ),
              )
            : DrawerHeader(
                child: Center(
                  child: Text(
                    'SHOW WORLD',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1b4f72),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
        Visibility(
          visible: _loggedIn,
          child: ListTile(
            leading: Icon(Icons.account_circle, color: Color(0xff1b4f72)),
            title: Text(
              'My Profile',
              style: drawerfonts,
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AccountHomePage();
                  },
                ),
              );
            },
          ),
        ),
        ListTile(
          leading: Icon(Icons.home, color: Color(0xff1b4f72)),
          title: Text(
            'Home',
            style: drawerfonts,
          ),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
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
            // Update the state of the app
            // ...
            // Then close the drawer
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
          leading: Icon(Icons.shopping_cart, color: Color(0xff1b4f72)),
          title: Text(
            'Buy Full Version',
            style: drawerfonts,
          ),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SubscriptionPage();
                },
              ),
            );
          },
        ),
        _loggedIn
            ? Container()
            : ListTile(
                leading: Icon(Icons.account_circle, color: Color(0xff1b4f72)),
                title: Text(
                  'LogIn | SignUp',
                  style: drawerfonts,
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
        ListTile(
          leading: Icon(Icons.info, color: Color(0xff1b4f72)),
          title: Text(
            'About Us',
            style: drawerfonts,
          ),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
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
        Visibility(
          visible: _loggedIn,
          child: ListTile(
            leading: Icon(Icons.exit_to_app, color: Color(0xff1b4f72)),
            title: Text(
              'Log Out',
              style: drawerfonts,
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              LoginStore().signOut(context);
            },
          ),
        ),
      ],
    );
  }
}
