import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/DesignThinking/widgets.dart';

class LevelUnlocked extends StatefulWidget {
  final int level;
  LevelUnlocked({Key key, @required this.level}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _LevelUnlockedState createState() => _LevelUnlockedState();
}

class _LevelUnlockedState extends State<LevelUnlocked> {
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
      backgroundColor: Color(0xfff4f4f4),
      body: SafeArea(
        child: Center(

            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StdBackButton(),
            WhiteScreen(
              height: height * 0.7,
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
                      child: SvgPicture.asset("assets/levelUnlocked.svg")
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
                      "Level ${widget.level}",
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
            Padding(
              padding: EdgeInsets.only(top: height * 0.05),
              child: StandardButton( text: "Play now!", onTap: () {}),
            )
          ],
        )),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
