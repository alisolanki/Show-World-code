import 'package:LoginPage/Desktop/mydesktop.dart';
import 'package:flutter/material.dart';
import '../Home/homepage.dart';
import '../subscriptionpage/subscriptionpage.dart';

class DrawerItems extends StatelessWidget {
  final loggedIn = true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        loggedIn
            ? UserAccountsDrawerHeader(
                onDetailsPressed: () {},
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
                  return MyDesktop();
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
                title: Text('Log In'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('About Us'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AboutDialog(
                    
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
