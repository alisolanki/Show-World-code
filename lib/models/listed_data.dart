import 'package:flutter/material.dart';

class ListedDataModel {
  String category;
  String subcategory;
  String fullname;
  String address;
  String mob;
  String mail;
  DateTime time;
  double price;
  ListedDataModel({
    @required this.category,
    @required this.subcategory,
    @required this.fullname,
    @required this.address,
    @required this.mob,
    @required this.mail,
    @required this.time,
    @required this.price,
  });
}

class Mobile {
  String mob;
  Mobile(this.mob);

  Map<int, dynamic> toJson() => {
        0: mob,
      };
}

class ListYourselfPatch {
  String address;
  String mail;
  String listends;
  Mobile mob;

  ListYourselfPatch({this.address, this.mail, this.listends, Mobile mob});

  Map toJson() {
    Map<int, dynamic> mob = this.mob != null ? this.mob.toJson() : null;
    return {'address': address, 'mail': mail, 'listends': listends, 'mob': mob};
  }
}
