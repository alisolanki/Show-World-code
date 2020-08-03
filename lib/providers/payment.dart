import 'dart:convert';

import 'package:ShowWorld/models/listed_data.dart';
import 'package:ShowWorld/providers/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../auth/auth-api.dart' as auth;

class PaymentProvider with ChangeNotifier {
  Razorpay _razorpaySubscription = Razorpay();
  bool _paymentmade = false;

  bool get paymentstatus {
    _paymentmade;
  }

  @override
  void dispose() {
    super.dispose();
    _razorpaySubscription.clear();
    _razorpayListYourself.clear();
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
    _razorpaySubscription.on(
        Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpaySubscription.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpaySubscription.on(
        Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
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
      _razorpaySubscription.open(options);
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  //ListYourself
  Razorpay _razorpayListYourself = Razorpay();

  ListedDataModel listyourselfsuccess;

  void _handlePaymentSuccessListYourself(PaymentSuccessResponse response) {
    print("Payment Success");
    _paymentmade = true;
    var mobile = Mobile(listyourselfsuccess.mob);
    var data = ListYourselfPatch(
      address: listyourselfsuccess.address,
      mail: listyourselfsuccess.mail,
      listends: listyourselfsuccess.time.toIso8601String(),
      mob: mobile,
    );

    try {
      http
          .patch(
        '${auth.url}/${listyourselfsuccess.category}%20(Listed)/${listyourselfsuccess.subcategory}/${listyourselfsuccess.fullname}.json?auth=${auth.token}',
        headers: {"Accept": "application/json"},
        body: jsonEncode(data),
      )
          .then(
        (value) async {
          print(
              "User Added to Directory in ${listyourselfsuccess.category} (Listed) Category");
          await DataProvider().fetchData(force: true);
        },
      );
    } catch (e) {
      throw (e);
    }
  }

  void _handlePaymentErrorListYourself(PaymentFailureResponse response) {
    print("Payment failed");
  }

  void _handleExternalWalletListYourself(ExternalWalletResponse response) {
    print("Choosing Wallet");
  }

  void makePaymentListYourself(ListedDataModel listedDataModel) {
    _razorpayListYourself.on(
        Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccessListYourself);
    _razorpayListYourself.on(
        Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentErrorListYourself);
    _razorpayListYourself.on(
        Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWalletListYourself);

    var options = {
      'key': '${auth.razorpaykey}',
      'amount': listedDataModel.price * 100,
      'name': 'Show World List Yourself',
      'description':
          'name: ${listedDataModel.fullname} mob: ${listedDataModel.mob} category: ${listedDataModel.category}',
      'prefill': {
        'contact': '${auth.user.phoneNumber}',
      }
    };

    listyourselfsuccess = listedDataModel;
    print("List Yourself Success: ${listyourselfsuccess.price}");
    try {
      _razorpayListYourself.open(options);
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }
}
