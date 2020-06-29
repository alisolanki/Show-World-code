import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Desktop/data_format.dart';

class DataProvider with ChangeNotifier {
  List<DataTemplate> _data = [
    // CategoryTemplate(
    //   id: 0,
    //   category: 'Artist',
    //   subcategory: ['Male Artist', 'Female Artist'],
    // ),
    // CategoryTemplate(
    //   id: 1,
    //   category: 'Director',
    //   subcategory: ['Male Director', 'Female Director'],
    // ),
  ];

  List<DataTemplate> get datalist {
    return [..._data];
  }

  Future<void> fetchData() async {
    const urldata= 'https://showworld-786.firebaseio.com/data.json';
    try {
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
              email: value['email'],
              phonenumber: value['phonenumber'],
            ));
            itr++;
          });
        });
      });
      _data = _loadeddata;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  void addCategory() {
    // _categorylist.add(value);
    notifyListeners();
  }
}