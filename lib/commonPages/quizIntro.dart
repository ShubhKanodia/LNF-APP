import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/commonPages/completedPage.dart';
import 'package:learnnfun/widgets.dart';

class QuizIntro extends StatefulWidget {
  @override
  _QuizIntro createState() => _QuizIntro();
}

class _QuizIntro extends State<QuizIntro> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        body: SafeArea(
            child: Center(
              child: Column(children: [
                //Image.asset("assets/revisionQuiz.png"),
                // heading
                Padding(
                  padding: EdgeInsets.only(top: height * 0.1, bottom: height * 0.1),
                  child: whiteScreen(context,
                      height: height * 0.45,
                      padding: 14,
                      children: [
                        Text("Catch the Correct Nuts",
                          style: GoogleFonts.quicksand(
                              color: const Color(0xffffa62b),
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: height * 0.05),
                        ),
                        Text(
                          "Match the following",
                          style: GoogleFonts.quicksand(
                              color: const Color(0xff16697a),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: height * 0.025),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Move the Squirrel to catch the correct answers!\n"
                              "Catch all the correct answers to finish the game.",
                          style: GoogleFonts.quicksand(
                              color: const Color(0xff1a1b41),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: height * 0.025),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                ),
                button(context,
                    text: "Let's Play!",
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TaskCompleted(
                              isTask: true,
                            ),
                            settings: RouteSettings(name: 'Actual game'))))
              ]),
            )));
  }
}
