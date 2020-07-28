import 'package:ShowWorld/Desktop/data_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/category.dart';

class OccupationField extends StatefulWidget {
  @override
  _OccupationFieldState createState() => _OccupationFieldState();
}

class _OccupationFieldState extends State<OccupationField> {
  String _dropdownValue;
  CategoryProvider _categoryprovider;
  List<CategoryTemplate> _categories;
  List<DropdownMenuItem<String>> _categorydropdown;
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      setState(() {
        _categoryprovider = Provider.of<CategoryProvider>(context);
        _categories = _categoryprovider.categorylist;
        _categories.forEach((e) {
          _categorydropdown.add(
            DropdownMenuItem(
              child: Text(e.category),
            ),
          );
          print(e.category);
        });
      });
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButton<String>(
        hint: Text("Occupation"),
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
        value: _dropdownValue,
        items: _categorydropdown,
        onChanged: (String newValue) {
          setState(() {
            _dropdownValue = newValue;
          });
        },
      ),
    );
  }
}
