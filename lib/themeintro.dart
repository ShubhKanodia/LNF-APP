import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'assets.dart';

class ThemeIntro extends StatefulWidget {
  ThemeIntro({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _ThemeIntroState createState() => _ThemeIntroState();
}

class _ThemeIntroState extends State<ThemeIntro> {
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
      backgroundColor: Color(0xffc1c1c1),
      body: Center(

          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: height * 0.15,
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
              /// TODO: Replace lock image with gift and a cross
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * 0.1,
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.45,
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
                  height: height * 0.1,
                ),
                Column(
                  /// TODO: Left and right padding on the text
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Gift a Friend",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                          color: Color(0xff489fb5),
                          fontSize: height * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Design a custom gift by using the Design Thinking method!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        color: Color(0xff489fb5),
                        fontSize: height * 0.02,
                      ),
                    ),
                    Text(
                      "Learn how to understand a user, and solve their problems creatively. As you progress, unlock more challenging levels and complete your course! Have fun!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        color: Color(0xff489fb5),
                        fontSize: height * 0.02,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: height * 0.01),
                    height: height * 0.09,
                    width: width * 0.65,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffca7602),
                            blurRadius: 0.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 10  horizontally
                              4.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        color: Color(0xffffa62b),
                        border: Border.all(
                          color: Color(0xffffa62b),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Continue",
                          style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.04),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height * 0.03,
                ),
              ],
            ),
          ),
        ],
      )),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
