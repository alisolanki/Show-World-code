import 'package:flutter/material.dart';
import 'data.dart';

class ArtistCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal.shade100,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
            offset: Offset(0, 3),
          )
        ],
      ),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Text(
            'Artists',
            style: TextStyle(
              fontSize: 20,
              color: Colors.teal,
            ),
          ),
          Container(
            child: Center(
              child: Column(
                children: ArtistData().artistData.map(
                  (index) {
                    return Column(
                      children: <Widget>[
                        Text(
                          'Name: ' + index.name,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Address: ' + index.address,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Phone Number: ' + index.phoneNumber,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Email: ' + index.email,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                      ],
                    );
                  },
                ).toList(),
              ),
            ),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),
    );
  }
}

class DirectorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red[100],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
            offset: Offset(0, 3),
          )
        ],
      ),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Text(
            'Directors',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
          Container(
            child: Center(
              child: Column(
                children: DirectorData().directorData.map(
                  (index) {
                    return Column(
                      children: <Widget>[
                        Text(
                          'Name: ' + index.name,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Address: ' + index.address,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Phone Number: ' + index.phoneNumber,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Email: ' + index.email,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                      ],
                    );
                  },
                ).toList(),
              ),
            ),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),
    );
  }
}
