import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Desktop/data_format.dart';
import '../providers/prices.dart';

class DurationField extends StatefulWidget {
  @override
  _DurationFieldState createState() => _DurationFieldState();
}

class _DurationFieldState extends State<DurationField> {
  String _dropdownDurationValue;
  PricesProvider _pricesprovider;
  List<DurationTemplate> _listyourself = [];
  List<DropdownMenuItem<String>> _durationdropdown = [];
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    _pricesprovider = Provider.of<PricesProvider>(context);
    if (_isInit) {
      setState(() {
        addDropdownItems();
      });
    }
    _listyourself = _pricesprovider.listyourselflist;
    print("_durations = $_listyourself");
    _listyourself.forEach((e) {
      _durationdropdown.add(
        DropdownMenuItem<String>(
          key: ValueKey("Duration"),
          child: Text(
            "${e.months} months",
            style: TextStyle(
              color: Color(0xff1b4f72),
            ),
          ),
          value: e.months,
        ),
      );
    });
    _isInit = false;
    super.didChangeDependencies();
  }

  void addDropdownItems() async {
    await _pricesprovider.fetchPricesData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButton<String>(
        hint: Text("Duration"),
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.grey,
        ),
        iconSize: 24,
        elevation: 16,
        underline: Container(
          height: 1,
          width: 1,
          color: Color(0xff1b4f72),
        ),
        value: _dropdownDurationValue,
        items: _durationdropdown,
        onChanged: (String newValue) {
          print("Changing to $newValue");
          setState(() {
            _dropdownDurationValue = newValue;
          });
        },
      ),
    );
  }
}
