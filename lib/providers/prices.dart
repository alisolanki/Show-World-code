import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Desktop/data_format.dart';
import '../auth/auth-api.dart' as auth;

class PricesProvider with ChangeNotifier {
  List<DurationTemplate> _listyourselfdata = [];
  List<DurationTemplate> _subscriptiondata = [];

  List<DurationTemplate> get listyourselflist {
    return [..._listyourselfdata];
  }

  List<DurationTemplate> get subscriptionlist {
    return [..._subscriptiondata];
  }

  Future<void> fetchPricesData() async {
    final _urllistyourself = auth.urllistyourself;
    final _urlsubscription = auth.urlsubscription;
    if (_subscriptiondata.length == 0 || _listyourselfdata.length == 0) {
      try {
        final _response = await http.get("$_urllistyourself?auth=${auth.token}");
        final _response1 = await http.get("$_urlsubscription?auth=${auth.token}");
        final _extractedlistyourself =
            jsonDecode(_response.body) as Map<String, dynamic>;
        final _extractedsubscription =
            jsonDecode(_response1.body) as Map<String, dynamic>;
        List<DurationTemplate> _loadeddata = [];
        // ListYourself
        _extractedlistyourself.forEach((key, value) {
          print("key: $key, price: $value");
          _loadeddata.add(
            DurationTemplate(
              months: key.toString(),
              price: double.parse(value.toString()),
            ),
          );
        });
        _listyourselfdata = _loadeddata;
        print("Fetched listyourself data");
        //Subscription
        _loadeddata = [];
        _extractedsubscription.forEach((key, value) {
          print("key: $key, price: $value");
          _loadeddata.add(
            DurationTemplate(
              months: key.toString(),
              price: double.parse(value.toString()),
            ),
          );
        });
        _subscriptiondata = _loadeddata;
        print("Fetched subscription data");
        notifyListeners();
      } catch (error) {
        print("Error has occured while fetching prices data.");
        throw (error);
      }
    } else {
      print("Prices data has already been fetched");
      return false;
    }
  }
}
