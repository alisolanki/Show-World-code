import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool tick = false;

class Cupons extends StatelessWidget {
  Cupons({this.checkboxTick});
  final Function checkboxTick;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(10.0),
      color: Colors.blueGrey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '36 Months',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'INR 2400 + GST',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                onPressed: null,
                color: Colors.blueGrey.shade400,
                child: Text(
                  'PROCEED',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                      tristate: false,
                      activeColor: Colors.transparent,
                      value: tick,
                      onChanged: (bool checkTick) {
                        checkboxTick();
                        tick = checkTick;
                      }),
                  Text(
                    'Enable Auto Debit',
                    style: TextStyle(
                      color: Colors.blueGrey.shade800,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
