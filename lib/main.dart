import 'package:ShowWorld/DynamicLink/services/dynamic_link_service.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './LoginOTP/pages/splash_page.dart';
import './LoginOTP/stores/login_store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _name = "none";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    handleDynamicLink();
  }

  Future handleDynamicLink() async {
    final PendingDynamicLinkData _data =
        await FirebaseDynamicLinks.instance.getInitialLink();

    final Uri _deeplink = _data?.link;
    if (_deeplink != null) {
      print('_handleDeepLink | _deeplink: $_deeplink');
      if (_deeplink.pathSegments.contains('post')) {
        _name = _deeplink.queryParameters['name'];
        print("_name = ${_deeplink.queryParameters['name']}");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('affiliateName', _name);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return throw ("Firebase.initializeApp() went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Provider.value(
            value: LoginStore(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashPage(),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
