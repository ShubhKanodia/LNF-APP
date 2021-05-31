import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/commonPages/completedPage.dart';
import 'package:learnnfun/quiz/catchthenut.dart';
import 'package:learnnfun/widgets.dart';

class QuizIntro extends StatelessWidget {
  const QuizIntro({
    Key key,
    @required this.name,
    this.text2,
    this.text3,
  }) : super(key: key);

  final String name;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          //child: Center(
          child: Container(
            width:width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Image.asset("assets/revisionQuiz.png"),
                  // heading
/*                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      backButton(context),
                      Container(
                        alignment: Alignment.topRight,
                        width: width * 0.5,
                        height: height * 0.1,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                                top: height * 0.04,
                                right: -width * 0.06,
                                child: Container(
                                    height: height * 0.05,
                                    width: width * 0.5,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(30)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: const Color(0x6616697a),
                                              offset: Offset(-4, 8),
                                              blurRadius: 10,
                                              spreadRadius: 0)
                                        ],
                                        color: const Color(0xffffffff)),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: width * 0.05,
                                          top: height * 0.025),
                                      child: Text(
                                        name,
                                        style: GoogleFonts.quicksand(
                                            color: const Color(0xff000000),
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                            fontSize: height * 0.015),
                                      ),
                                    ))),
                            Positioned(
                              top: height * 0.01,
                              right: -width * 0.03,
                              child: Container(
                                  height: height * 0.05,
                                  width: width * 0.5,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xb216697a),
                                            offset: Offset(-4, 4),
                                            blurRadius: 8,
                                            spreadRadius: 0)
                                      ],
                                      color: const Color(0xff16697a)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 0.05, top: height * 0.005),
                                    child: Text(
                                      "Revision",
                                      style: GoogleFonts.quicksand(
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: height * 0.03),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )*/
                  whiteScreen(context, height: height * 0.45, children: [
                    Text(name,
                        style: GoogleFonts.quicksand(
                            color: const Color(0xffffa62b),
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.05),
                        textAlign: TextAlign.center),
                    Text(
                      text2,
                      style: GoogleFonts.quicksand(
                          color: const Color(0xff16697a),
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: height * 0.028),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      text3,
                      style: GoogleFonts.quicksand(
                          color: const Color(0xff1a1b41),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: height * 0.025),
                      textAlign: TextAlign.center,
                    ),
                  ]),
                  button(context, text: "Let's Play!", onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => CatchTheNut(start: true),
                        settings: RouteSettings(name: 'Tasks')),);
                  })
                ]),
          ),
        ));
  }
}
