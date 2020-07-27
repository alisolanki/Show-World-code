import 'package:flutter/material.dart';
import 'coupons.dart';

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          titleSpacing: 1,
          centerTitle: true,
          title: const Text(
            'SHOW WORLD',
            style: TextStyle(
              fontFamily: "roboto",
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
              fontSize: 25,
              color: Color(0xff1b4f72),
            ),
          ),
          iconTheme: const IconThemeData(
            color: Color(0xff1b4f72),
          ),
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
                  color: Colors.grey[700],
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
