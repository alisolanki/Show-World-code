import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Desktop/data_format.dart';
import '../auth/auth-api.dart' as auth;

class DataProvider with ChangeNotifier {
  bool _subscribed = false;

  List<DataTemplate> _data = [];

  List<DataTemplate> get datalist {
    return [..._data];
  }

  bool get subscription {
    return _subscribed;
  }

  Future<void> checkSubscription() async {
    print("Checking Subscription");
    try {
      var _response = await http.get(auth.urlallusers);
      var _extracteddata = jsonDecode(_response.body) as Map<String, dynamic>;
      if (_extracteddata == null) {
        return;
      } else {
        print("You User id is subscribed");
        _subscribed = true;
        notifyListeners();
      }
    } catch (error) {
      print("Not Subscribed");
      throw (error);
    }
  }

  Future<bool> fetchData({bool force = false}) async {
    if (_data.length == 0 || force == true) {
      _data = [];
      if (force == true) {
        _subscribed = force;
      }
      String urldata;
      await checkSubscription();
      _subscribed ? urldata = auth.urldata : urldata = auth.urldemo;
      try {
        _subscribed ? print("Fetching data") : print("Fetching demo");
        var _response = await http.get(urldata);
        var _extracteddata = jsonDecode(_response.body) as Map<String, dynamic>;
        List<DataTemplate> _loadeddata = [];
        int itr = 0;
        _extracteddata.forEach((category, subcategory) {
          Map<String, dynamic> _subcategorylist = subcategory;
          _subcategorylist.forEach((subcategoryname, names) {
            Map<String, dynamic> name = names;
            name.forEach((nametext, value) {
              _loadeddata.add(DataTemplate(
                  id: itr,
                  category: category,
                  subcategory: subcategoryname,
                  name: nametext,
                  address: _subscribed ? value['address'] : "demo",
                  email: _subscribed ? value['mail'] : "demo",
                  phonenumber: _subscribed ? value['mob'] : ["demo"].toList()));
              itr++;
            });
          });
        });
        _data = _loadeddata.toList();
        print("Data: $_data}");
        notifyListeners();
        return false;
      } catch (error) {
        print("Error has occured during fetching data/demo");
        throw (error);
      }
    } else {
      print("All people data has already been fetched");
      return false;
    }
  }

  void addCategory() {
    // _categorylist.add(value);
    notifyListeners();
  }
}
