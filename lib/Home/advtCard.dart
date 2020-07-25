import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AdvertisementCardTop extends StatelessWidget {
//  final double _width;
//  AdvertisementCardTop(this._width);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
//        width: _width * 0.9,
        decoration: BoxDecoration(
            color: Colors.grey[300],
//            boxShadow: [
//              BoxShadow(
//                  color: Colors.white,
//                  blurRadius: 2,
//                  spreadRadius: 0.5,
//                  offset: Offset(-1, -1)),
//              BoxShadow(
//                  color: Colors.grey[600],
//                  blurRadius: 2,
//                  spreadRadius: 0.5,
//                  offset: Offset(1, 1))
//            ],
            borderRadius: BorderRadius.circular(10)),
        child: CarouselSlider(
          items: <Widget>[
            Text("Advertisement T 1"),
            Text("Advertisement T 2"),
            Text("Advertisement T 3")
          ],
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
//  final double _width;
//  AdvertisementCardBottom(this._width);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
//            boxShadow: [
//              BoxShadow(
//                  color: Colors.white,
//                  blurRadius: 2,
//                  spreadRadius: 0.5,
//                  offset: Offset(-1, -1)),
//              BoxShadow(
//                  color: Colors.grey[600],
//                  blurRadius: 2,
//                  spreadRadius: 0.5,
//                  offset: Offset(1, 1))
//            ],
            borderRadius: BorderRadius.circular(10)),
//        width: _width * 0.9,
        child: CarouselSlider(
          items: <Widget>[
            Text("Advertisement B 1"),
            Text("Advertisement B 2"),
            Text("Advertisement B 3")
          ],
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
          ),
        ),
      ),
    );
  }
}
