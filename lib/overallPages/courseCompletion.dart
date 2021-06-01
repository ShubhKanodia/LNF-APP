import 'package:davinci/core/davinci_capture.dart';
import 'package:davinci/davinci.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/overallPages/levels.dart';
import 'package:learnnfun/widgets.dart';

import '../auth.dart';

class CourseCompletion extends StatefulWidget {
  CourseCompletion({Key key}) : super(key: key);

  @override
  _CourseCompletion createState() => _CourseCompletion();
}

class _CourseCompletion extends State<CourseCompletion> {

  GlobalKey certificate;
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Text(
                  "Design Thinking",
                  style: GoogleFonts.quicksand(
                      color: const Color(0xffffa62b),
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: height * 0.05),
                ),
                    Davinci(
                      builder:(key) {
                        this.certificate = key;
                        return Container(
                          height: height * 0.6,
                          width: width * 0.8,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Course Completion",
                                  style: GoogleFonts.quicksand(
                                      color: const Color(0xff16697a),
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: height * 0.04),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "This is to certify that",
                                      style: GoogleFonts.quicksand(
                                          color: const Color(0xff373c44),
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: height * 0.02),
                                    ),
                                    Text(
                                      Auth()
                                          .getCurrentUser()
                                          .displayName,
                                      style: GoogleFonts.quicksand(
                                          color: const Color(0xff489fb5),
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: height * 0.05),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: width * 0.06, right: width * 0.06,),
                                  child: Text(
                                    "has completed a a course on design thinking that includes EDIPT process via a gamified model of learning.",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.quicksand(
                                        color: const Color(0xff373c44),
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: height * 0.02),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Design Thinking",
                                      style: GoogleFonts.quicksand(
                                          color: const Color(0xff16697a),
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: height * 0.04),
                                    ),
                                    Text(
                                      "gifting a friend",
                                      style: GoogleFonts.quicksand(
                                          color: const Color(0xff16697a),
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: height * 0.02),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Certified By",
                                  style: GoogleFonts.quicksand(
                                      color: const Color(0xff373c44),
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: height * 0.02),
                                ),
                                Image.asset("assets/grasp.png"),
                              ],
                            ),
                          ),
                        );
                      }),
                    StandardButton( text: "share", onTap: () async {await DavinciCapture.click(certificate, fileName: "Design Thinking Certificate ");}),
                    TextButton(
                      onPressed: (){
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Levels(),
                              settings: RouteSettings(
                                  name: 'Levels')),
                              (Route<dynamic> route) => false,
                        );
                      },
                      child: Text(
                        "Continue",
                        style: GoogleFonts.quicksand(
                            color: const Color(0xff16697a),
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.04),
                      ),
                    ),
              ]),
            )));
  }
}
//button(context, text: "Continue", onTap: () {})