import 'package:flutter/material.dart';

import '../Desktop/drawer.dart';
import './advtCard.dart';
import './cards.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
