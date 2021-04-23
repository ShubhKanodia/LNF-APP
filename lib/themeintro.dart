import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/completedPage.dart';
import 'package:learnnfun/person_list.dart';
import 'package:learnnfun/widgets.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          whiteScreen(
            context,
            height: height * 0.7,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: height * 0.08,
                  width: width * 0.45,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05, right: width * 0.05),
                      child: Image.asset("assets/gift.png"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.02,
                    right: width * 0.02,
                    top: height * 0.04),
                child: Column(
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
              ),
              button(context, text: "Continue", onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PersonList(),
                      settings: RouteSettings(name: 'Actual game')),
                );
              })
            ],
          ),
        ],
      )),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
