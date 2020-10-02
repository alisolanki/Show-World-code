import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:ShowWorld/auth/auth-api.dart' as auth;

class AgreementPage extends StatefulWidget {
  @override
  _AgreementPageState createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
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
      adUnitId: auth.adInterstitialId2,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd4e6f1),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
          title: const Text(
            'Agreement',
            style: TextStyle(
              fontFamily: "roboto",
              fontWeight: FontWeight.w600,
              color: Color(0xff1b4f72),
            ),
          ),
          iconTheme: const IconThemeData(
            color: Color(0xff1b4f72),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Agreement coming soon",
                style: TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 70.0,
            )
          ],
        ),
      ),
    );
  }
}
