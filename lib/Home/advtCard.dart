import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AdvertisementCardTop extends StatelessWidget {
  final double _width;
  AdvertisementCardTop(this._width);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: _width * 0.9,
        color: Colors.blue[100],
        child: CarouselSlider(
          items: <Widget>[Text("Advertisement T 1"), Text("Advertisement T 2"), Text("Advertisement T 3")],
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
          ),
        ),
      ),
    );
  }
}

class AdvertisementCardBottom extends StatelessWidget {
  final double _width;
  AdvertisementCardBottom(this._width);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: _width * 0.9,
        color: Colors.blue[100],
        child: CarouselSlider(
          items: <Widget>[Text("Advertisement B 1"), Text("Advertisement B 2"), Text("Advertisement B 3")],
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
          ),
        ),
      ),
    );
  }
}
