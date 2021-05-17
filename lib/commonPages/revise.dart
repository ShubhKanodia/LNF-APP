import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/widgets.dart';
import '../Persona.dart';

class Revise extends StatefulWidget {
  Revise({Key key,}) : super(key: key);

  @override
  _Revise createState() => _Revise();
}

class _Revise extends State<Revise> {

  void initState() {
    super.initState();

  }

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.1,
                          top: height * 0.02,
                          right: width * 0.1,
                          bottom: height * 0.03),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: width * 0.3,
                            height: height * 0.075,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(250),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x1e000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(currentProgress.trophies.toString(),
                                  style: GoogleFonts.quicksand(
                                    color: Color(0xff16697a),
                                    fontSize: height * 0.045,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.end),
                            ),
                          ),
                          Container(
                              height: height * 0.075,
                              width: width * 0.15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff0e4f5c),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: Color(0xff489fb5),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.03, right: width * 0.03),
                                child: Image.asset("assets/trophy.png"),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.1,
                          top: height * 0.02,
                          right: width * 0.1,
                          bottom: height * 0.03),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: width * 0.3,
                            height: height * 0.075,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(250),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x1e000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(currentProgress.rewards.toString(),
                                  style: GoogleFonts.quicksand(
                                    color: Color(0xff16697a),
                                    fontSize: height * 0.045,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.end),
                            ),
                          ),
                          Container(
                              height: height * 0.075,
                              width: width * 0.15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff0e4f5c),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: Color(0xff489fb5),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 0.03, right: width * 0.03),
                                  child: SvgPicture.asset("assets/medal.svg"))),
                        ],
                      ),
                    ),
                  ],
                ),
                whiteScreen(context, height: height * 0.5, children: [
                  Container(
                    height: height * 0.2,
                    width: width * 0.7,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.03, right: width * 0.03, top: height*0.2),
                          child: Image.asset("assets/revising.png")),
                    ),
                  ),
                  Container(
                    height: height * 0.02,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Let's Revise!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quicksand(
                            color: Color(0xff489fb5),
                            fontSize: height * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ]),
                button(context, text: "Begin", onTap: null)
              ],
            )),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
