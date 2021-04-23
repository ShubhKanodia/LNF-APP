import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learnnfun/introductionSlider.dart';
import 'package:learnnfun/levels.dart';
import 'package:learnnfun/registerInfo.dart';
import 'package:overlay_support/overlay_support.dart';

import 'auth.dart';
import 'empathizeOneOne.dart';
import 'introductionSlider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      // ignore: missing_return
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Directionality(
              textDirection: TextDirection.ltr,
              child: new Container(child: Text("Firebase went wrong")));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          if (kDebugMode) {
            FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
          }
          FlutterError.onError =
              FirebaseCrashlytics.instance.recordFlutterError;
          BaseAuth auth = new Auth();

          if (auth.getCurrentUser() != null) {
            if (auth.getCurrentUser().displayName == null ||
                auth.getCurrentUser().displayName == "null") {
              return OverlaySupport(
                  child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'Learn N Fun',
                      theme: ThemeData(
                        fontFamily: 'Quicksand',
                        primaryColor: const Color(0xff16697a),
                        accentColor: const Color(0xffffa62b),
                      ),
                      home: RegistrationInfo()));
            } else {
              return OverlaySupport(
                  child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'Learn N Fun',
                      theme: ThemeData(
                        fontFamily: 'Quicksand',
                        primaryColor: const Color(0xff16697a),
                        accentColor: const Color(0xffffa62b),
                      ),
                      home:
                      EmpathizeOneOne())); //TODO: Change this to whatever you want while testing, but change to ThemeIntro() before pushing
              //TaskCompleted(rewards: 10, task: true, trophies: 10)));
            }
          } else {
            return OverlaySupport(
                child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Learn N Fun',
                    theme: ThemeData(
                      fontFamily: 'Quicksand',
                      primaryColor: const Color(0xff16697a),
                      accentColor: const Color(0xffffa62b),
                    ),
                    home: IntroductionSlider()));
          }
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator(); //TODO : Change to Splash Screen
      },
    );
  }
}
