import 'package:ShowWorld/Free_resources/filmbudget/budget_model.dart';
import 'package:ShowWorld/Free_resources/filmbudget/budget_tile.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ShowWorld/auth/auth-api.dart' as auth;

class FilmBudgetPage extends StatefulWidget {
  @override
  _FilmBudgetPageState createState() => _FilmBudgetPageState();
}

class _FilmBudgetPageState extends State<FilmBudgetPage> {
  var totalAmount = 0.0;

  static const MobileAdTargetingInfo _targetingInfo = MobileAdTargetingInfo(
    nonPersonalizedAds: true,
    keywords: <String>[
      'Film',
      'Bollywood',
      'Films',
      'Utility',
      'Software',
      'Classes',
      'Donate',
      'insurance',
      'Game',
      'education'
    ],
  );

  InterstitialAd _interstitialAd;

  InterstitialAd _createInterstitialAd() {
    return InterstitialAd(
      adUnitId: auth.adInterstitialId,
      targetingInfo: _targetingInfo,
      listener: (MobileAdEvent _event) {
        print("InterstitialAd event is $_event");
      },
    );
  }

  @override
  void initState() {
    super.initState();
    try {
      FirebaseAdMob.instance
          .initialize(appId: auth.adMobId)
          .then((_) => _interstitialAd = _createInterstitialAd()..load());
      setState(() {
        calculateTotalAmount();
      });
    } catch (e) {
      throw (e);
    }
  }

  @override
  void dispose() {
    super.dispose();
    try {
      _interstitialAd..show();
      _interstitialAd.dispose();
    } catch (e) {
      throw (e);
    }
  }

  Future<void> disposeData(BuildContext ctx) async {
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete data"),
          content: Text("Clear all data?"),
          actions: [
            FlatButton(
              child: Text("Yes"),
              onPressed: () {
                setState(() {
                  disposeAllData();
                  Navigator.pop(context);
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd4e6f1),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          title: const Text(
            'Film Budget',
            style: TextStyle(
              fontFamily: "roboto",
              fontWeight: FontWeight.w600,
              color: Color(0xff1b4f72),
            ),
          ),
          iconTheme: const IconThemeData(
            color: Color(0xff1b4f72),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => disposeData(context),
              ),
            ),
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () => calculateTotalAmount(),
            ),
          ],
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () =>

          // ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Total Film Budget is: Rs.$totalAmount",
                style: TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
            ),
            ...BudgetModel()
                .budgetModel
                .entries
                .map((e) => BudgetTile(e.key, e.value))
                .toList(),
            const SizedBox(
              height: 70.0,
            )
          ],
        ),
      ),
    );
  }

  Future<void> disposeAllData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear().then((_) => {calculateTotalAmount()}).catchError(
          (e) => throw (e),
        );
  }

  Future<double> _readData({String key}) async {
    final prefs = await SharedPreferences.getInstance();
    print('read ${prefs.getDouble(key)}');
    return prefs.getDouble(key) ?? 0.0;
  }

  void calculateTotalAmount() {
    totalAmount = 0.0;
    BudgetModel().budgetModel.entries.forEach((map) {
      map.value.forEach((_value) {
        _readData(key: "${map.key}_$_value").then(
          (v) => setState(() {
            totalAmount += v;
          }),
        );
      });
    });
    print("_totalAmount: $totalAmount");
  }
}
