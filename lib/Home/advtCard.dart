import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AdvertisementCardTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: width * 0.9,
        height: 120,
        color: Colors.blue[100],
        child: CarouselSlider(
          items: <Widget>[Text("Advertisement T 1"), Text("Advertisement T 2"), Text("Advertisement T 3")],
          options: CarouselOptions(
            height: 400.0,
            autoPlay: true,
          ),
        ),
      ),
    );
  }
}

class AdvertisementCardBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: width * 0.9,
        height: 120,
        color: Colors.blue[100],
        child: CarouselSlider(
          items: <Widget>[Text("Advertisement B 1"), Text("Advertisement B 2"), Text("Advertisement B 3")],
          options: CarouselOptions(
            height: 400.0,
            autoPlay: true,
          ),
        ),
      ),
    );
  }
}
