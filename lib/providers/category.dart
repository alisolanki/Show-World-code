import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Desktop/data_format.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryTemplate> _categorydata = [
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

  List<CategoryTemplate> get categorylist {
    return [..._categorydata];
  }

  Future<void> fetchCategoryData() async {
    const urlcategory = 'https://showworld-786.firebaseio.com/categories.json';
    try {
      final _response = await http.get(urlcategory);
      final _extractedcategory =
          jsonDecode(_response.body) as Map<String, dynamic>;
      List<CategoryTemplate> _loadeddata = [];
      int itr = 0;
      _extractedcategory.forEach((key, value) {
        _loadeddata.add(CategoryTemplate(
          id: itr,
          category: key,
          subcategory: value as List,
        ));
        itr++;
      });
      _categorydata = _loadeddata;
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
