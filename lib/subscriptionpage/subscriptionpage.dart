import 'package:flutter/material.dart';
import 'coupons.dart';

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Show World',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  'Choose Subscription Plan',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
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
              Coupons("36 Months", 5000),
              Coupons("12 Months", 1500),
              Coupons("6 Months", 1000),
            ],
          ),
        ),
      ),
    );
  }
}
