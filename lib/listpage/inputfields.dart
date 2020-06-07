import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'occupationfield.dart';
import 'constants.dart';

class InputFields extends StatefulWidget {
  @override
  _InputFieldsState createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  void hideOptionMenu() {
    setState(() {
      showOptions = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blue[100],
            offset: Offset(0, 2),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          TextField(
            onTap: () {
              hideOptionMenu();
            },
            showCursor: true,
            autocorrect: false,
            cursorColor: Colors.black38,
            cursorRadius: Radius.circular(10.0),
            decoration: InputDecoration(
              focusColor: Colors.black12,
              focusedBorder: InputBorder.none,
              hintText: 'First Name',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            onTap: () {
              hideOptionMenu();
            },
            showCursor: true,
            autocorrect: false,
            cursorColor: Colors.black38,
            cursorRadius: Radius.circular(10.0),
            decoration: InputDecoration(
              focusColor: Colors.black12,
              focusedBorder: InputBorder.none,
              hintText: 'Last Name',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            onTap: () {
              hideOptionMenu();
            },
            showCursor: true,
            autocorrect: false,
            maxLines: 3,
            cursorColor: Colors.black38,
            cursorRadius: Radius.circular(10.0),
            decoration: InputDecoration(
              focusColor: Colors.black12,
              focusedBorder: InputBorder.none,
              hintText: 'Address',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            showCursor: true,
            onTap: () {
              hideOptionMenu();
            },
            autocorrect: false,
            keyboardType: TextInputType.phone,
            cursorColor: Colors.black38,
            cursorRadius: Radius.circular(10.0),
            maxLength: 10,
            decoration: InputDecoration(
              focusColor: Colors.black12,
              focusedBorder: InputBorder.none,
              counterText: '',
              prefixText: "+91 ",
              prefixStyle: TextStyle(color: Colors.black),
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.grey,
              ),
              hintText: 'Phone Number',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            showCursor: true,
            onTap: () {
              hideOptionMenu();
            },
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.black38,
            cursorRadius: Radius.circular(10.0),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: Colors.grey,
              ),
              focusColor: Colors.black12,
              focusedBorder: InputBorder.none,
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          OccupationField(),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            showCursor: true,
            onTap: () {
              hideOptionMenu();
            },
            autocorrect: false,
            cursorColor: Colors.black38,
            keyboardType: TextInputType.numberWithOptions(decimal: false),
            cursorRadius: Radius.circular(10.0),
            decoration: InputDecoration(
              focusColor: Colors.black12,
              focusedBorder: InputBorder.none,
              hintText: 'Duration',
              suffixText: 'years',
              suffixStyle: TextStyle(
                color: Colors.black,
              ),
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
