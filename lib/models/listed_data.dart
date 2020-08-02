import 'package:flutter/material.dart';

class ListedDataModel {
  String fullname;
  String address;
  String mob;
  String mail;
  DateTime time;
  String category;
  String subcategory;
  ListedDataModel({
    @required this.fullname,
    @required this.address,
    @required this.mob,
    @required this.mail,
    @required this.time,
    @required this.category,
    @required this.subcategory,
  });
}
