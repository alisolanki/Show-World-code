import 'package:ShowWorld/Free_resources/filmbudget/film_budget_page.dart';
import 'package:ShowWorld/Free_resources/filmrevenue/film_revenue_page.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import '../auth/auth-api.dart' as auth;
import './agreement/agreement_page.dart';

class FreeResourcesPage extends StatefulWidget {
  @override
  _FreeResourcesPageState createState() => _FreeResourcesPageState();
}

class _FreeResourcesPageState extends State<FreeResourcesPage> {
  static const MobileAdTargetingInfo _targetingInfo = MobileAdTargetingInfo(
    nonPersonalizedAds: true,
    keywords: <String>[
      'film',
      'bollywood',
      'films',
      'game',
      'education',
      'insurance',
      'loans',
      'mortgage',
      'attorney',
      'credit',
      'electricity',
      'classes',
      'donate',
      'utility',
      'software',
      'india'
    ],
  );

  BannerAd _bannerAd;

  BannerAd _createBannerAd() {
    return BannerAd(
      adUnitId: auth.adBannerId,
      size: AdSize.banner,
      targetingInfo: _targetingInfo,
      listener: (MobileAdEvent _event) {
        print("BannerAd $_event");
      },
    );
  }

  @override
  void initState() {
    try {
      FirebaseAdMob.instance.initialize(appId: auth.adMobId).then((_) {
        _bannerAd = _createBannerAd()
          ..load()
          ..show();
      });
    } catch (e) {
      throw (e);
    }
    super.initState();
  }

  @override
  void dispose() {
    try {
      Future.delayed(Duration(milliseconds: 500), () {
        if (_bannerAd != null) _bannerAd.dispose();
        _bannerAd = null;
      });
    } catch (e) {
      throw (e);
    }
    print("Banner ad is disposed");
    super.dispose();
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buttonTemplate(
                context,
                "Film Budget",
                Icons.account_balance_wallet,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buttonTemplate(
                context,
                "Agreement",
                Icons.assignment,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buttonTemplate(
                context,
                "Film Revenue",
                Icons.monetization_on,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "More Features coming out soon. Stay Tuned.",
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buttonTemplate(BuildContext cont, String _title, IconData _icondata) {
    void _navigateFilmBudget(BuildContext ctx) {
      Navigator.push(
        ctx,
        MaterialPageRoute(
          builder: (ctx) {
            return FilmBudgetPage();
          },
        ),
      );
    }

    void _navigateAgreement(BuildContext ctx) {
      Navigator.push(
        ctx,
        MaterialPageRoute(
          builder: (ctx) {
            return AgreementPage();
          },
        ),
      );
    }

    void _navigateFilmRevenue(BuildContext ctx) {
      Navigator.push(
        ctx,
        MaterialPageRoute(
          builder: (ctx) {
            return FilmRevenuePage();
          },
        ),
      );
    }

    return FlatButton(
      highlightColor: Color(0xffd4e6f1),
      onPressed: () {
        switch (_title) {
          case "Agreement":
            {
              _navigateAgreement(cont);
              break;
            }
          case "Film Budget":
            {
              _navigateFilmBudget(cont);
              break;
            }
          case "Film Revenue":
            {
              _navigateFilmRevenue(cont);
              break;
            }
          default:
            {
              break;
            }
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.indigo[100],
                blurRadius: 2,
                offset: Offset(1, 3),
                spreadRadius: 1,
              ),
            ]),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ),
              child: Icon(
                _icondata,
                color: Colors.indigo,
              ),
            ),
            Text(
              _title,
              style: TextStyle(
                fontFamily: "roboto",
                fontWeight: FontWeight.w600,
                color: Colors.indigo,
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
