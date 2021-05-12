import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/commonPages/completedPage.dart';
import 'package:learnnfun/widgets.dart';

class InformationCard extends StatefulWidget {
  final int cardNumber;

  InformationCard({Key key, @required this.cardNumber}) : super(key: key);

  @override
  _InformationCardState createState() => _InformationCardState();
}

class _InformationCardState extends State<InformationCard> {
  List<List<dynamic>> pageContent = [
    [
      "In this task you learnt the first step of design thinking",
      "Empathise",
      "To empathise means to understand and share the feelings of another person. In the design thinking process, one can empathise by creating a survey and asking the right type of questions. We must let the user talk about a problem freely, without asking too many leading questions.",
    ],
    [
      "In this task you learnt the second step of design thinking",
      "Define",
      "To empathise means to understand and share the feelings of another person. In the design thinking process, one can empathise by creating a survey and asking the right type of questions. We must let the user talk about a problem freely, without asking too many leading questions.",
    ],
    [
      "In this task you learnt the third step of design thinking",
      "Ideate",
      "To empathise means to understand and share the feelings of another person. In the design thinking process, one can empathise by creating a survey and asking the right type of questions. We must let the user talk about a problem freely, without asking too many leading questions.",
    ],
    [
      "In this task you learnt the fourth step of design thinking",
      "Prototype",
      "To empathise means to understand and share the feelings of another person. In the design thinking process, one can empathise by creating a survey and asking the right type of questions. We must let the user talk about a problem freely, without asking too many leading questions.",
    ],
    [
      "In this task you learnt the fifth step of design thinking",
      "Testing",
      "To empathise means to understand and share the feelings of another person. In the design thinking process, one can empathise by creating a survey and asking the right type of questions. We must let the user talk about a problem freely, without asking too many leading questions.",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
          child: Column(children: [
            backButton(context),
            Padding(
              padding: EdgeInsets.only(top: height * 0.03),
              child: whiteScreen(context,
                  height: height * 0.65,
                  padding: 14,
                  children: [
                    Text(
                      pageContent[widget.cardNumber][1],
                      style: GoogleFonts.quicksand(
                          color: const Color(0xff489fb5),
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: height * 0.05),
                    ),
                    Text(
                      pageContent[widget.cardNumber][2],
                      maxLines: null,
                      style: GoogleFonts.quicksand(
                          color: const Color(0xff1a1b41),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: height * 0.025),
                      textAlign: TextAlign.center,
                    ),
                    /* Text(
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
                    ),*/
                    button(context,
                        text: "Continue",
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TaskCompleted(
                                      isTask: true,
                                    ),
                                settings: RouteSettings(name: 'Actual game'))))
                  ]),
            )
          ]),
        )));
  }
}
