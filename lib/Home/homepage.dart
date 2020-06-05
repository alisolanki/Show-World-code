import 'package:LoginPage/Desktop/drawer.dart';
import 'package:flutter/material.dart';
import 'advtCard.dart';
import 'cards.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              AdvertisementCard(),
              DirectoryCard(),
              ListCard(),
              BuyCard(),
              AdvertisementCard(),
            ],
          ),
        ),
      ),
    );
  }
}
