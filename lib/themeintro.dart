import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/completedPage.dart';

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
                ElevatedButton(
                    child: Text("Continue",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.025),
                        textAlign: TextAlign.left),
                    style: ButtonStyle(
                      shadowColor:
                          MaterialStateProperty.all<Color>(Color(0xffcb7703)),
                      elevation: MaterialStateProperty.resolveWith<double>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) return 0;
                          return 8; // Use the component's default.
                        },
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                          Size(width * 0.5, height * 0.06)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26.0),
                      )),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Color(0xffffa62b);
                          return Color(
                              0xffffa62b); // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TaskCompleted(),
                            settings: RouteSettings(name: 'Actual game')),
                      );
                    }),
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
