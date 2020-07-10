import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Desktop/data_format.dart';
import '../auth/auth-api.dart' as auth;

class DataProvider with ChangeNotifier {
  List<DataTemplate> _data = [];

  List<DataTemplate> get datalist {
    return [..._data];
  }

  Future<bool> fetchData() async {
    final urldata = auth.urldata;
    if (_data.length == 0) {
      try {
        print("Fetched data");
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
                address: value['address'],
                email: value['mail'],
                phonenumber: value['mob'],
              ));
              itr++;
            });
          });
        });
        _data = _loadeddata;
        notifyListeners();
        return false;
      } catch (error) {
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
