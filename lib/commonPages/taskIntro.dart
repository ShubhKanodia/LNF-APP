import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:learnnfun/widgets.dart';

import '../data.dart';

class TaskIntro extends StatefulWidget {
  final int taskNumber;

  TaskIntro({Key key, @required this.taskNumber, }) : super(key: key);

  @override
  _TaskIntroState createState() => _TaskIntroState();
}

class _TaskIntroState extends State<TaskIntro> {
  get pageContent => taskIntroData;


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
            child: Column(children: [
          Row(children: [
            StdBackButton(),
            Padding(
              padding: EdgeInsets.only(left: width * 0.25),
              child: Text(
                pageContent[widget.taskNumber][0],
                style: GoogleFonts.quicksand(
                    color: const Color(0xff202842),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: height * 0.03),
              ),
            )
          ]),
          Text(
            pageContent[widget.taskNumber][1],
            style: GoogleFonts.quicksand(
                color: const Color(0xff489fb5),
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: height * 0.05),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: height * 0.02, left: width * 0.15, right: width * 0.15),
              child: Text(
                pageContent[widget.taskNumber][2],
                maxLines: null,
                style: GoogleFonts.quicksand(
                    color: const Color(0xff1a1b41),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: height * 0.02),
                textAlign: TextAlign.center,
              )),
          Padding(
            padding: EdgeInsets.only(top: height * 0.03),
            child: WhiteScreen(
                height: height * 0.65,
                padding: 14,
                children: [
                  Text(
                    "Instructions",
                    style: GoogleFonts.quicksand(
                        color: const Color(0xff16697a),
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: height * 0.04),
                  ),
                  Text(
                    pageContent[widget.taskNumber][3],
                    maxLines: null,
                    style: GoogleFonts.quicksand(
                        color: const Color(0xff1a1b41),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: height * 0.025),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    pageContent[widget.taskNumber][4],
                    maxLines: null,
                    style: GoogleFonts.quicksand(
                        color: const Color(0xff1a1b41),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: height * 0.025),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    pageContent[widget.taskNumber][5],
                    maxLines: null,
                    style: GoogleFonts.quicksand(
                        color: const Color(0xff1a1b41),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: height * 0.025),
                    textAlign: TextAlign.center,
                  ),
                  StandardButton( text: "Continue", onTap: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => pageContent[widget.taskNumber][6],
                        settings: RouteSettings(name: 'Actual game')),
                  );
                  })
                ]),
          )
        ])));
  }
}
