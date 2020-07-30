import 'dart:convert';

import 'package:ShowWorld/providers/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../auth/auth-api.dart' as auth;

class PaymentProvider with ChangeNotifier {
  Razorpay _razorpay = Razorpay();
  bool _paymentmade = false;

  bool get paymentstatus {
    _paymentmade;
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Success");
    _paymentmade = true;

    Map<String, String> data = {
      'mob': '${auth.user.phoneNumber}',
      'timestamp': '${DateTime.now().toIso8601String()}',
    };
    try {
      http
          .patch(
        auth.urlallusers,
        headers: {"Accept": "application/json"},
        body: jsonEncode(data),
      )
          .then(
        (value) async {
          print("User Added to Subscription List");
          await DataProvider().fetchData(force: true);
        },
      );
    } catch (e) {
      throw (e);
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("Choosing Wallet");
  }

  void makePayment(double price) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    var options = {
      'key': '${auth.razorpaykey}',
      'amount': price * 1,
      'name': 'Show World Subscription',
      'description': 'Subscription',
      'prefill': {
        'contact': '${auth.user.phoneNumber}',
      }
    };
    try {
      _razorpay.open(options);
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }
}
