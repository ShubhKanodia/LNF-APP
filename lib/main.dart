import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learnnfun/Persona.dart';
import 'package:learnnfun/commonPages/quiz.dart';
import 'package:learnnfun/commonPages/revise.dart';
import 'package:learnnfun/overallPages/levels.dart';
import 'package:learnnfun/overallPages/registerInfo.dart';
import 'package:learnnfun/tasks/5_test.dart';
import 'package:overlay_support/overlay_support.dart';
import 'overallPages/levelEvaluation.dart';

import 'auth.dart';
import 'commonPages/completedPage.dart';
import 'overallPages/login.dart';

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
            userDocReference.get().then((value) {
              if (value.data()["taskUnlocked"] != null &&
                  value.data()["rewards"] != null &&
                  value.data()["trophies"] != null ) {
                currentProgress.taskUnlocked = value.data()["taskUnlocked"];
                currentProgress.rewards = value.data()["rewards"];
                currentProgress.trophies = value.data()["trophies"];
              }
              if(value.data()["personIndex"] != null) currentPersona = allPersonasLevel1[value.data()["personIndex"]];
            });
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
                      Test())); //TODO: Change this to whatever you want while testing, but change to Levels() before pushing


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
                    home: Login()));
          }
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator(); //TODO : Change to Splash Screen
      },
    );
  }
}