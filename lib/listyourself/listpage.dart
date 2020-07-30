import 'package:ShowWorld/listpage/occupationfield.dart';
import 'package:ShowWorld/listyourself/category_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

UnderlineInputBorder textFieldDecoration = UnderlineInputBorder(
    borderSide: BorderSide(
  color: Color(0xff1b4f72),
));
UnderlineInputBorder focusedTextFieldDecoration = UnderlineInputBorder(
    borderSide: BorderSide(
  color: Colors.blueAccent,
));

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final _lastnamefocusnode = FocusNode();
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffd4e6f1),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        backgroundColor: Color(0xff1b4f72),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 20,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 20.0),
          alignment: Alignment.topCenter,
          child: Form(
            key: ValueKey("listyourself"),
            child: ListView(
              children: <Widget>[
                //Title
                Card(
                  shadowColor: Colors.blue[300],
                  elevation: 1,
                  color: Color(0xdd1a5276),
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    padding: EdgeInsets.all(10),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "roboto",
                          fontSize: _width * 0.07,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.account_box,
                              size: _width * 0.075,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "    List Yourself",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //Form Fields
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 20.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
//                        boxShadow: [
//                          BoxShadow(
//                            color: Colors.blue[300],
//                            offset: Offset(0, 2),
//                            spreadRadius: 0,
//                            blurRadius: 0,
//                          )
//                        ]
                    ),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "First Name",
                              focusedBorder: focusedTextFieldDecoration,
                              enabledBorder: textFieldDecoration),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) => FocusScope.of(context)
                              .requestFocus(_lastnamefocusnode),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Last Name",
                              focusedBorder: focusedTextFieldDecoration,
                              enabledBorder: textFieldDecoration),
                          textInputAction: TextInputAction.next,
                          focusNode: _lastnamefocusnode,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Address",
                              focusedBorder: focusedTextFieldDecoration,
                              enabledBorder: textFieldDecoration),
                          textInputAction: TextInputAction.next,
                          minLines: null,
                          maxLines: null,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Phone Number",
                              focusedBorder: focusedTextFieldDecoration,
                              enabledBorder: textFieldDecoration),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.phone,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Email id",
                              focusedBorder: focusedTextFieldDecoration,
                              enabledBorder: textFieldDecoration),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // OccupationField("Duration"),
                          ],
                        ),
                        CategoryFields(),
                      ],
                    ),
                  ),
                ),
                //List Button
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: _width * 0.3,
                  ),
                  child: RaisedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'roboto',
                          fontSize: _width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    disabledColor: Colors.blueGrey,
                    color: Color(0xdd1a5276),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
