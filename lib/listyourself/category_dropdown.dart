import 'dart:ui';

import 'package:ShowWorld/Desktop/data_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/category.dart';

class CategoryFields extends StatefulWidget {
  @override
  _CategoryFieldsState createState() => _CategoryFieldsState();
}

class _CategoryFieldsState extends State<CategoryFields> {
  String _dropdownCategoryValue;
  String _dropdownSubcategoryValue;
  CategoryProvider _categoryprovider;
  List<CategoryTemplate> _categories = [];
  List<DropdownMenuItem<String>> _categorydropdown = [];
  Map<String, List<DropdownMenuItem<String>>> _subcategorydropdown = {};
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    _categoryprovider = Provider.of<CategoryProvider>(context);
    if (_isInit) {
      setState(() {
        addDropdownItems();
      });
    }
    _categories = _categoryprovider.categorylist;
    print("_categories = $_categories");
    _categories.forEach((e) {
      _categorydropdown.add(
        DropdownMenuItem<String>(
          key: ValueKey("Category"),
          child: Text(
            e.category,
            style: TextStyle(
              color: Color(0xff1b4f72),
            ),
          ),
          value: e.category,
        ),
      );
      _subcategorydropdown.addAll({
        e.category: e.subcategory
            .map(
              (subcat) => DropdownMenuItem<String>(
                key: ValueKey(subcat),
                child: Text(
                  subcat,
                  style: TextStyle(
                    color: Color(0xff1b4f72),
                  ),
                ),
                value: subcat,
              ),
            )
            .toList() as List<DropdownMenuItem<String>>,
      });
      print("_subcat : $_subcategorydropdown");
    });
    _isInit = false;
    super.didChangeDependencies();
  }

  void addDropdownItems() async {
    await _categoryprovider.fetchCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: DropdownButton<String>(
            hint: Text("Category"),
            icon: Icon(
              Icons.arrow_downward,
              color: Colors.grey,
            ),
            iconSize: 24,
            elevation: 16,
            underline: Container(
              height: 2,
              color: Colors.blue,
            ),
            value: _dropdownCategoryValue,
            items: _categorydropdown,
            onChanged: (String newValue) {
              print("Changing to $newValue");
              setState(() {
                _dropdownSubcategoryValue = null;
                _dropdownCategoryValue = newValue;
              });
            },
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: DropdownButton<String>(
            hint: Text("Sub Category"),
            icon: Icon(
              Icons.arrow_downward,
              color: Colors.grey,
            ),
            iconSize: 24,
            elevation: 16,
            underline: Container(
              height: 2,
              color: Colors.blue,
            ),
            value: _dropdownSubcategoryValue,
            items: _subcategorydropdown[_dropdownCategoryValue],
            onChanged: (String newValue) {
              print("Changing to $newValue");
              setState(() {
                _dropdownSubcategoryValue = newValue;
              });
            },
          ),
        ),
      ],
    );
  }
}
