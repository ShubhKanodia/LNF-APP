import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/widgets.dart';

class InformationCard extends StatefulWidget {
  final int cardNumber;

  InformationCard({Key key, @required this.cardNumber}) : super(key: key);

  @override
  _InformationCardState createState() => _InformationCardState();
}

class _InformationCardState extends State<InformationCard> {
  List<List<String>> pageContent = [
    [
      "In this task you learnt the first step of design thinking",
      "Empathise",
      "To empathise means to understand and share the feelings of another person. In the design thinking process, one can empathise by creating a survey and asking the right type of questions. We must let the user talk about a problem freely, without asking too many leading questions.",
    ],
    [
      "In this task you learnt the first step of design thinking",
      "Empathise",
      "To empathise means to understand and share the feelings of another person. In the design thinking process, one can empathise by creating a survey and asking the right type of questions. We must let the user talk about a problem freely, without asking too many leading questions.",
    ],
  ];

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
          Text(
            pageContent[widget.cardNumber][1],
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
                pageContent[widget.cardNumber][2],
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
            child: whiteScreen(context,
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
                    pageContent[widget.cardNumber][3],
                    maxLines: null,
                    style: GoogleFonts.quicksand(
                        color: const Color(0xff1a1b41),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: height * 0.025),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    pageContent[widget.cardNumber][4],
                    maxLines: null,
                    style: GoogleFonts.quicksand(
                        color: const Color(0xff1a1b41),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: height * 0.025),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    pageContent[widget.cardNumber][5],
                    maxLines: null,
                    style: GoogleFonts.quicksand(
                        color: const Color(0xff1a1b41),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: height * 0.025),
                    textAlign: TextAlign.center,
                  ),
                  button(context, text: "Continue", onTap: () {})
                ]),
          )
        ])));
  }
}
