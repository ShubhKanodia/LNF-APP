import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/introductionSlider.dart';
import 'package:learnnfun/person_list.dart';
import 'package:learnnfun/registerInfo.dart';
import 'package:overlay_support/overlay_support.dart';

import 'assets.dart';
import 'auth.dart';

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
                          PersonList())); //TODO: Change this to whatever you want while testing, but change to ThemeIntro() before pushing
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(

          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                child: Container(
                    height: height * 0.1,
                    width: width * 0.15,
                    alignment: Alignment.topLeft,
                    child: Assets.backButton),
              ),
            ],
          ),
          Container(
            width: width * 0.84,
            height: height * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height * 0.1),
              boxShadow: [
                BoxShadow(
                  color: Color(0x338b8b8b),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.2,
                  width: width * 0.6,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05, right: width * 0.05),
                      child: Assets.lockImage,
                    ),
                  ),
                ),
                Container(
                  height: height * 0.02,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Level 1",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        color: Color(0xff489fb5),
                        fontSize: height * 0.045,
                      ),
                    ),
                    Text(
                      "Unlocked!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                          color: Color(0xff489fb5),
                          fontSize: height * 0.045,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                margin: EdgeInsets.only(top: height * 0.05),
                height: height * 0.08,
                width: width * 0.65,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0, // soften the shadow
                        spreadRadius: 2.0, //extend the shadow
                        offset: Offset(
                          3.0, // Move to right 10  horizontally
                          5.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                    color: Color(0xffffa62b),
                    border: Border.all(
                      color: Color(0xffffa62b),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Play now!",
                      style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.04),
                    ),
                  ],
                )),
          ),
        ],
      )),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
