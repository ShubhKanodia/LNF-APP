import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learnnfun/DesignThinking/Persona.dart';
import 'package:learnnfun/DesignThinking/overallPages/levels.dart';
import 'package:learnnfun/DesignThinking/overallPages/registerInfo.dart';
import 'package:overlay_support/overlay_support.dart';

import 'auth.dart';
import 'DesignThinking/data.dart';
import 'DesignThinking/overallPages/login.dart';

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
          l1Score.task = {};
          l2Score.task = {};
          if (auth.getCurrentUser() != null) {
            userDocReference.get().then((value) {
              if(value.data()["l1personIndex"] != null) currentPersonaL1 = level1Persona[value.data()["l1personIndex"]];
              if(value.data()["l2personIndex"] != null) currentPersonaL2 = level2Persona[value.data()["l2personIndex"]];

              if(value.data()["L1T1"]!=null) l1Score.task[1] = value.data()["L1T1"];
              if(value.data()["L1T2"]!=null) l1Score.task[2] = value.data()["L1T2"];
              if(value.data()["L1T3"]!=null) l1Score.task[3] = value.data()["L1T3"];
              if(value.data()["L1T4"]!=null) l1Score.task[4] = value.data()["L1T4"];
              if(value.data()["L1Quiz"]!=null) l1Score.quiz = value.data()["L1Quiz"];
              if(value.data()["L2T1"]!=null) l2Score.task[1] = value.data()["L2T1"];
              if(value.data()["L2T2"]!=null) l2Score.task[2] = value.data()["L2T2"];
              if(value.data()["L2T3"]!=null) l2Score.task[3] = value.data()["L2T3"];
              if(value.data()["L2T4"]!=null) l2Score.task[4] = value.data()["L2T4"];
              if(value.data()["L2Quiz"]!=null) l2Score.quiz = value.data()["L2Quiz"];
              if (value.data()["taskUnlocked"] != null &&
                  value.data()["rewards"] != null &&
                  value.data()["trophies"] != null ) {
                currentProgress.taskUnlocked = value.data()["taskUnlocked"];
                currentProgress.rewards = value.data()["rewards"];
                currentProgress.trophies = value.data()["trophies"];
              }
            });
            if (auth.getCurrentUser().displayName == null ||
                auth.getCurrentUser().displayName == "null") {
              return OverlaySupport(
                  child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'Learn N Fun',
                      theme: ThemeData(
                        fontFamily: 'Quicksand',
                        primaryColor: const Color(0xff16697a), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xffffa62b)),
                      ),
                      home: RegistrationInfo()));
            } else {
              return OverlaySupport(
                  child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'Learn N Fun',
                      theme: ThemeData(
                        fontFamily: 'Quicksand',
                        primaryColor: const Color(0xff16697a), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xffffa62b)),
                      ),
                      home:
                      Levels())); //TODO: Change this to whatever you want while testing, but change to Levels() before pushing


              //TaskCompleted(rewards: 10, task: true, trophies: 10)));
            }
          } else {

            return OverlaySupport(
                child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Learn N Fun',
                    theme: ThemeData(
                      fontFamily: 'Quicksand',
                      primaryColor: const Color(0xff16697a), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xffffa62b)),
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