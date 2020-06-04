import 'package:flutter/material.dart';

class DataTile extends StatefulWidget {
  @override
  _DataTileState createState() => _DataTileState();
}

class _DataTileState extends State<DataTile> {
  bool _showdetails = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          color: Colors.blue[800],
          child: ListTile(
            title: Text(
              "Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            subtitle: Text("Categories", style: TextStyle(color: Colors.white)),
            trailing: Icon(
                _showdetails ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            dense: true,
            onTap: () {
              setState(() {
                _showdetails = !_showdetails;
              });
            },
          ),
        ),
        _showdetails
            ? Column(
                children: <Widget>[
                  //details
                  Card(
                    color: Colors.blue[50],
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Address:",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Phone Number:",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Email:",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              )
            : SizedBox(width: 10)
      ],
    );
  }
}
