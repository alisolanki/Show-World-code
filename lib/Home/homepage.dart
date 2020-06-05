import 'package:LoginPage/Desktop/drawer.dart';
import 'package:flutter/material.dart';
import 'advtCard.dart';
import 'cards.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AdvertisementCardTop(_width),
              DirectoryCard(_height, _width),
              ListCard(_height, _width),
              BuyCard(_height, _width),
              AdvertisementCardBottom(_width),
            ],
          ),
        ),
      ),
    );
  }
}
