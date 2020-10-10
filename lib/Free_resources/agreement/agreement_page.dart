import 'package:ShowWorld/Free_resources/agreement/agreement_pdf.dart';
import 'package:ShowWorld/Free_resources/agreement/model/agreement_model.dart';
import 'package:ShowWorld/Free_resources/agreement/pdf_view_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:ShowWorld/auth/auth-api.dart' as auth;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

class AgreementPage extends StatefulWidget {
  @override
  _AgreementPageState createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
  final _formkey = GlobalKey<FormState>();
  var _rewarded = false;

  AgreementModel _agreementModel = AgreementModel(
    artistAssociaName: "____",
    artistName: "____",
    artistWorkingName: "____",
    day: "____",
    directorName: "____",
    month: "____",
    panNumber: "____",
    perdayFee: "____",
    place: "____",
    postProductionFee: "____",
    producerName: "____",
    productionTitle: "____",
    shootingFee: "____",
    signingFee: "____",
    totalFee: "____",
  );

  String _path = "";

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
    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {int rewardAmount, String rewardType}) {
      print("Rewarded VideoAd Event: $event");
      if (event == RewardedVideoAdEvent.rewarded) {
        setState(() {
          _rewarded = true;
        });
      } else if (event == RewardedVideoAdEvent.failedToLoad) {
        setState(() {
          _rewarded = true;
        });
      }
    };
    try {
      FirebaseAdMob.instance
          .initialize(appId: auth.adMobId)
          .then((_) => _interstitialAd = _createInterstitialAd()..load());
      getApplicationDocumentsDirectory().then((value) => _path = value.path);
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

  Future<void> _dialogBox(BuildContext ctx) async {
    await showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Watch Ad"),
          content: Text("Watch this Ad to be able to share the pdf:"),
          actions: [
            Center(
              child: FlatButton(
                child: Text("Ok"),
                onPressed: () async {
                  try {
                    RewardedVideoAd.instance
                        .show()
                        .then((_) => Navigator.pop(context));
                  } catch (e) {
                    Navigator.pop(context);
                    throw (e);
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _saveForm(BuildContext ctx) async {
    RewardedVideoAd.instance.load(
      adUnitId: auth.rewardedId,
      targetingInfo: _targetingInfo,
    );
    await _dialogBox(ctx);
    _formkey.currentState.save();
    _path = await generateDocument(_agreementModel);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
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
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () async {
                if (_formkey.currentState.validate()) {
                  await _saveForm(context);
                  if (_rewarded) {
                    await generateDocument(_agreementModel);
                    Fluttertoast.showToast(
                      msg: "Saved as agreement_by_showworld_film_directory.pdf",
                      backgroundColor: Colors.green,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PdfViewPage(_path);
                        },
                      ),
                    );
                  }
                }
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                shadowColor: Colors.blue[300],
                elevation: 1,
                color: Color(0xdd1a5276),
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 8.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "roboto",
                        fontSize: _width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.assignment,
                            size: _width * 0.045,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: "  Artiste/Technician Agreement",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                "Fill out the form to generate a pdf Agreement",
                style: TextStyle(
                  fontFamily: 'roboto',
                  color: Colors.black87,
                  fontSize: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 20.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Details",
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Artist's/Technician's Name"),
                        onSaved: (v) => _agreementModel.artistName = v,
                        validator: (v) {
                          if (v.length == 0) {
                            return "Enter a name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: "Producer's name"),
                        onSaved: (v) => _agreementModel.producerName = v,
                        validator: (v) {
                          if (v.length == 0) {
                            return "Enter a name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: "Director's name"),
                        onSaved: (v) => _agreementModel.directorName = v,
                        validator: (v) {
                          if (v.length == 0) {
                            return "Enter a name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: "Production title"),
                        onSaved: (v) => _agreementModel.productionTitle = v,
                        validator: (v) {
                          if (v.length == 0) {
                            return "Enter the production title";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: "Artist working as"),
                        onSaved: (v) => _agreementModel.artistWorkingName = v,
                        validator: (v) {
                          if (v.length == 0) {
                            return "Enter the artist's on-screen name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Artiste/Techn. Pan No."),
                        onSaved: (v) => _agreementModel.panNumber = v,
                        validator: (v) {
                          if (v.length == 0) {
                            return "Enter the PAN number";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Place"),
                        onSaved: (v) => _agreementModel.place = v,
                        validator: (v) {
                          if (v.length == 0) {
                            return "Enter the place name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Day"),
                        onSaved: (v) => _agreementModel.day = v,
                        keyboardType: TextInputType.number,
                        validator: (v) {
                          if (v.length == 0) {
                            return "Enter the day";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Month"),
                        onSaved: (v) => _agreementModel.month = v,
                        validator: (v) {
                          if (v.length == 0) {
                            return "Enter the month name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Artist's association name"),
                        onSaved: (v) => _agreementModel.artistAssociaName = v,
                        validator: (v) {
                          if (v.length == 0) {
                            return "Enter the artist association's name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "Remuneration",
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: "Total fee payment"),
                        onSaved: (v) => _agreementModel.totalFee = v,
                        keyboardType: TextInputType.number,
                        validator: (v) {
                          if (v.length == 0) {
                            return "Enter a number";
                          } else if (v.contains(new RegExp(r'[0-9]'))) {
                            return null;
                          } else {
                            return "Enter a number";
                          }
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Signing fee"),
                        onSaved: (v) => _agreementModel.signingFee = v,
                        keyboardType: TextInputType.number,
                        validator: (v) {
                          if (v.length == 0) {
                            return "Enter a number";
                          } else if (v.contains(new RegExp(r'[0-9]'))) {
                            return null;
                          } else {
                            return "Enter a number";
                          }
                        },
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: "During shooting fee"),
                        onSaved: (v) => _agreementModel.shootingFee = v,
                        keyboardType: TextInputType.number,
                        validator: (v) {
                          if (v.length == 0) {
                            return "Enter a number";
                          } else if (v.contains(new RegExp(r'[0-9]'))) {
                            return null;
                          } else {
                            return "Enter a number";
                          }
                        },
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: "Post production fee"),
                        onSaved: (v) => _agreementModel.postProductionFee = v,
                        keyboardType: TextInputType.number,
                        validator: (v) {
                          if (v.length == 0) {
                            return "Enter a number";
                          } else if (v.contains(new RegExp(r'[0-9]'))) {
                            return null;
                          } else {
                            return "Enter a number";
                          }
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Per day fee"),
                        onSaved: (v) => _agreementModel.perdayFee = v,
                        keyboardType: TextInputType.number,
                        validator: (v) {
                          if (v.length == 0) {
                            return "Enter a number";
                          } else if (v.contains(new RegExp(r'[0-9]'))) {
                            return null;
                          } else {
                            return "Enter a number";
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: _width * 0.3,
                ),
                child: RaisedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'roboto',
                        fontSize: _width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  color: Color(0xdd1a5276),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      await _saveForm(context);
                      if (_rewarded) {
                        await generateDocument(_agreementModel);
                        Fluttertoast.showToast(
                          msg:
                              "Details have been saved. Click to view or share: agreement_by_showworld_film_directory.pdf",
                          backgroundColor: Colors.green,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PdfViewPage(_path);
                            },
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
              SizedBox(
                height: 70.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
