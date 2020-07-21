import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Desktop/data_format.dart';
import '../auth/auth-api.dart' as auth;

class DataProvider with ChangeNotifier {
  bool _subscribed = false;

  List<DataTemplate> _data = [];

  List<DataTemplate> get datalist {
    return [..._data];
  }

  isSubscribed() {
    _subscribed = true;
  }

  isNotSubscribed() {
    _subscribed = false;
  }

  Future<bool> fetchData() async {
    String urldata;
    _subscribed ? urldata = auth.urldata : urldata = auth.urldemo;
    if (_data.length == 0) {
      try {
        _subscribed ? print("Fetched data") : print("Fetched demo");
        final _response = await http.get(urldata);
        final _extracteddata =
            jsonDecode(_response.body) as Map<String, dynamic>;
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
                phonenumber: _subscribed ? value['mob'] : ["demo"],
              ));
              itr++;
            });
          });
        });
        _data = _loadeddata;
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
