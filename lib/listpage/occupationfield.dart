import 'package:flutter/material.dart';
import 'constants.dart';

class OccupationField extends StatefulWidget {
  @override
  _OccupationFieldState createState() => _OccupationFieldState();
}

List<String> categories = ['Occupation', 'Director', 'Artist', 'Producer'];

class _OccupationFieldState extends State<OccupationField> {
  String _dropdownValue = categories[0];
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: DropdownButton<String>(
        hint: Text("Occupation"),
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        underline: Container(
          height: 2,
          color: Colors.blue,
        ),
        value: _dropdownValue,
        items: categories.map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
        onChanged: (String newValue) {
          setState(() {
            _dropdownValue = newValue;
          });
        },
      ),
    );
  }
}
