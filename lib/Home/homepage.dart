import 'package:flutter/material.dart';
import 'advtCard.dart';
import 'fourCards.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            AdvertisementCard(),
            FourCards(),
            FourCards(),
            FourCards(),
            FourCards(),
            AdvertisementCard(),
          ],
        ),
      ),
    );
  }
}
