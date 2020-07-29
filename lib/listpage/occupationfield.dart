import 'package:ShowWorld/Desktop/data_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/category.dart';

class OccupationField extends StatefulWidget {
  String _fieldname;
  OccupationField(this._fieldname);
  @override
  _OccupationFieldState createState() => _OccupationFieldState();
}

class _OccupationFieldState extends State<OccupationField> {
  String _dropdownValue;
  CategoryProvider _categoryprovider;
  List<CategoryTemplate> _categories = [];
  List<DropdownMenuItem<String>> _categorydropdown = [];
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
    _categories.forEach((e) {
      _categorydropdown.add(
        DropdownMenuItem<String>(
          key: ValueKey(widget._fieldname),
          child: Text(e.category),
          value: e.category,
        ),
      );
    });
    _isInit = false;
    super.didChangeDependencies();
  }

  void addDropdownItems() async {
    await _categoryprovider.fetchCategoryData();
    print("_categories = $_categories");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButton<String>(
        hint: Text(widget._fieldname),
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
          print("changing to $newValue");
          setState(() {
            _dropdownValue = newValue;
          });
        },
      ),
    );
  }
}
