import 'package:flutter/material.dart';
import 'cupons.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Show World',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                'Choose Subscription Plan',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '(Get access to 25,000+ listings in 300+ categories across the film and music industry)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Cupons(
                checkboxTick: () {
                  setState(() {});
                },
              ),
              Cupons(
                checkboxTick: () {
                  setState(() {});
                },
              ),
              Cupons(
                checkboxTick: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
