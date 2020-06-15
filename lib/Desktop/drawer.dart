import 'package:flutter/material.dart';

import './categorypage.dart';
import '../Login2/login_screen.dart';
import '../Account/account_home.dart';
import '../subscriptionpage/subscriptionpage.dart';
import '../listpage/constants.dart';

class DrawerItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        loggedIn
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
                currentAccountPicture: CircleAvatar(
                  child: Text("P"),
                ),
                accountName: Text("name"),
                accountEmail: Text("email@gmail.com"),
              )
            : DrawerHeader(
                child: Center(
                  child: Text(
                    'Show World',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
        Visibility(
          visible: loggedIn,
          child: ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Profile'),
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
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.list),
          title: Text('Categories'),
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
          leading: Icon(Icons.shopping_cart),
          title: Text('Buy Full Version'),
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
        loggedIn
            ? Container()
            : ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('LogIn | SignUp'),
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
          leading: Icon(Icons.info),
          title: Text('About Us'),
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
                    applicationIcon: Icon(Icons.camera),
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
          visible: loggedIn,
          child: ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log Out'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
