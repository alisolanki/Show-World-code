import 'package:flutter/material.dart';
import 'constants.dart';

class OccupationField extends StatefulWidget {
  @override
  _OccupationFieldState createState() => _OccupationFieldState();
}

class _OccupationFieldState extends State<OccupationField> {
  List<String> _suggestedString = [];
  TextEditingController _textFieldController = TextEditingController();
  List<String> _listOfStrings = [
    'Director',
    'Artist',
    'Actor',
    'Producer',
  ];
  _onChanged(String value) {
    setState(() {
      _suggestedString = _listOfStrings
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          enableInteractiveSelection: true,
          showCursor: true,
          keyboardAppearance: Brightness.dark,
          controller: _textFieldController,
          onTap: () {
            setState(() {
              showOptions = !showOptions;
            });
          },
          autocorrect: true,
          enableSuggestions: true,
          cursorColor: Colors.black38,
          cursorRadius: Radius.circular(10.0),
          decoration: InputDecoration(
            focusColor: Colors.black12,
            hintText: 'Occupation',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
          onChanged: _onChanged,
        ),
        showOptions
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Card(
                  color: Colors.yellow[100],
                  shadowColor: Colors.grey,
                  child: Column(
                    children: _suggestedString.map((string) {
                      return ListTile(
                        onTap: () {
                          setState(() {});
                        },
                        title: Text(string),
                      );
                    }).toList(),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
