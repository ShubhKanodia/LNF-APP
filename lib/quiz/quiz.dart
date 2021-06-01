/*
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/overallPages/courseCompletion.dart';
import 'package:learnnfun/widgets.dart';

import '../Persona.dart';
import '../auth.dart';

*/
/*
class Quiz extends StatefulWidget {
  @override
  _Quiz createState() => _Quiz();
}

class _Quiz extends State<Quiz> {
  int quizScore = 0;
  bool scoreChangeVisible = false;
  String scoreChange = "+2";
  int buttonPressed;

  int index = 0;
  bool checked = false;
  bool mcq = false;
  Map matched = {};

  @override
  Widget build(BuildContext context) {
    *//*

*/
/*List mftQuestions = mtfList[index].keys.toList();
    mftQuestions.shuffle();
    List mftAnswers = mtfList[index].values.toList();
    mftAnswers.shuffle();*//*
*/
/*

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    backButton(context),
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.03),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  child: LinearProgressIndicator(
                                    backgroundColor: Color(0xffe1e1e1),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xff489fb5)),
                                    value: quizScore / 10,
                                    minHeight: height * 0.02,
                                  ),
                                ),
                                Visibility(
                                  visible: scoreChangeVisible,
                                  child: Align(
                                    alignment: Alignment.lerp(
                                        Alignment.bottomLeft,
                                        Alignment.bottomRight,
                                        quizScore / 10.toDouble()),
                                    child: Text(scoreChange),
                                  ),
                                ),
                              ],
                            ))),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.04),
                      child: Text(quizScore.toString(),
                          style: GoogleFonts.quicksand(
                              color: const Color(0xff489fb5),
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: height * 0.07),
                          textAlign: TextAlign.center),
                    )
                  ],
                ),
                MSQ(
                  buttonPressed: buttonPressed,
                  checkQuestion: checkQuestion,
                  index: index,
                ),
                *//*

*/
/*mcq
                    ? MSQ(
                        buttonPressed: buttonPressed,
                        checkQuestion: checkQuestion,
                        index: index - mtfList.length,
                      )
                    : MTF(
                        matched: matched,
                        mtfAnswers: mftAnswers,
                        mtfQuestions: mftQuestions,
                  checkMatched: checkMatched,
                      ),*//*
*/
/*

                Visibility(
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                  maintainInteractivity: true,
                  visible: checked,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.035,
                      bottom: height * 0.015,
                    ),
                    child: Container(
                      height: height * 0.07,
                      width: width * 1,
                      color: buttonPressed == mcqList[index].correctAnswer
                          ? Color(0xff90ca5e)
                          : Color(0xffdb3333),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.005,
                              left: width * 0.05,
                              right: width * 0.05),
                          child: Text(
                              buttonPressed == mcqList[index].correctAnswer
                                  ? "You're Right!"
                                  : "Try Again",
                              style: GoogleFonts.quicksand(
                                color: Color(0xffffffff),
                                fontSize: height * 0.035,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                StandardButton(
                    text: buttonPressed == null
                        ? "Check"
                        : checked == true
                            ? "Continue"
                            : "Check",
                    onTap: buttonPressed == null
                        ? null
                        : () {
                            if (checked) if (index <
                                mcqList.length  - 1)
                              setState(() {
                                index++;
                                checked = false;
                                buttonPressed = null;
                                scoreChangeVisible = false;
                              });
                            else {
                              userDocReference.update({
                                "trophies": 1,
                                "rewards": FieldValue.increment(quizScore),
                                "taskUnlocked": 7
                              });
                              currentProgress.taskUnlocked = 7;
                              currentProgress.rewards += quizScore;
                              currentProgress.trophies = 1;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CourseCompletion(),
                                    settings: RouteSettings(name: 'Tasks')),
                              );
                            }
                            else {
                              if (buttonPressed ==
                                  mcqList[index].correctAnswer) {
                                setState(() {
                                  scoreChange = "+2";
                                  quizScore = quizScore >= 10
                                      ? quizScore
                                      : quizScore + 2;
                                  scoreChangeVisible = true;
                                  checked = true;
                                });
                              } else {
                                setState(() {
                                  scoreChange = "-1";
                                  quizScore = quizScore == 0
                                      ? quizScore
                                      : quizScore - 1;
                                  scoreChangeVisible = true;
                                  checked = true;
                                });
                              }
                            }
                          })
              ],
            ),
          ),
        ));
  }

  void checkQuestion(answerNumber) {
    setState(() {
      buttonPressed = answerNumber;
      checked = false;
    });
  }

  void checkMatched(key, value) {
    setState(() {
      matched[key] = value;
      buttonPressed = 1;
      checked = false;
    });
  }
}

class MSQ extends StatefulWidget {
  final int buttonPressed;

  final int index;

  final Function checkQuestion;

  const MSQ(
      {Key key,
      @required this.buttonPressed,
      @required this.index,
      @required this.checkQuestion})
      : super(key: key);

  @override
  _MSQState createState() => _MSQState();
}

class _MSQState extends State<MSQ> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          "Select the right answer",
          style: GoogleFonts.quicksand(
              textStyle: TextStyle(
                  color: const Color(0xff16697a),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: height * 0.03)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: whiteScreen(
                context,
                width: width * 0.85,
                height: height * 0.15,
                elevation: 10,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.02,
                      right: width * 0.02,
                    ),
                    child: Text(mcqList[widget.index].question,
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w500,
                          color: Color(0xffffa62b),
                          fontSize: height * 0.03,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                eachOption(height, width, 0),
                eachOption(height, width, 1)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                eachOption(height, width, 2),
                eachOption(height, width, 3)
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget eachOption(height, width, answerNumber) {
    return Padding(
        padding: EdgeInsets.only(
          left: width * 0.03,
          bottom: height * 0.01,
          top: height * 0.02,
          right: width * 0.02,
        ),
        child: GestureDetector(
          onTap: () => widget.checkQuestion(answerNumber),
          child: Container(
            decoration: widget.buttonPressed == answerNumber
                ? BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: Color(0xffffa62b),
                    ),
                    borderRadius: BorderRadius.circular(height * 0.01))
                : null,
            child: whiteScreen(context,
                height: height * 0.15,
                width: width * 0.4,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Text(mcqList[widget.index].answers[answerNumber],
                        style: GoogleFonts.quicksand(
                          color: widget.buttonPressed == answerNumber
                              ? Color(0xffffa62b)
                              : Color(0xff16697a),
                          fontWeight: widget.buttonPressed == answerNumber
                              ? FontWeight.w500
                              : FontWeight.w400,
                          fontSize: height * 0.022,
                        )),
                  ),
                ]),
          ),
        ));
  }
}

*//*

*/
/*
class MTF extends StatefulWidget {
  final List mtfQuestions;
  final List mtfAnswers;
  final Map matched;
  final Function checkMatched;
  const MTF({Key key, this.mtfQuestions, this.mtfAnswers, this.matched, this.checkMatched})
      : super(key: key);

  @override
  _MTFState createState() => _MTFState();
}

class _MTFState extends State<MTF> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          "Select the right answer",
          style: GoogleFonts.quicksand(
              textStyle: TextStyle(
                  color: const Color(0xff16697a),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: height * 0.03)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: whiteScreen(
                context,
                width: width * 0.85,
                height: height * 0.15,
                elevation: 10,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.02,
                      right: width * 0.02,
                    ),
                    child: Text(
                        "Match the correct pairs based on what you know about Design Thinking",
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w500,
                          color: Color(0xffffa62b),
                          fontSize: height * 0.03,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.05),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(widget.mtfQuestions.length, (index) {
                  return Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.03,
                        bottom: height * 0.01,
                        top: height * 0.02,
                        right: width * 0.02,
                      ),
                      child: Draggable(
                        feedback: Text(widget.mtfQuestions[index],
                            style: GoogleFonts.quicksand(
                              color: widget.matched.containsKey(
                                  widget.mtfQuestions[index])
                                  ? Color(0xffffa62b)
                                  : Color(0xff16697a),
                              fontWeight: widget.matched.containsKey(
                                  widget.mtfQuestions[index])
                                  ? FontWeight.w500
                                  : FontWeight.w400,
                              fontSize: height * 0.022,
                            )),
                        child: Container(
                          decoration: widget.matched
                                  .containsKey(widget.mtfQuestions[index])
                              ? BoxDecoration(
                                  border: Border.all(
                                    width: 4,
                                    color: Colors.green,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(height * 0.01))
                              : null,
                          child: whiteScreen(context,
                              height: height * 0.08,
                              width: width * 0.4,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.05),
                                  child: Text(widget.mtfQuestions[index],
                                      style: GoogleFonts.quicksand(
                                        color: widget.matched.containsKey(
                                                widget.mtfQuestions[index])
                                            ? Color(0xffffa62b)
                                            : Color(0xff16697a),
                                        fontWeight: widget.matched.containsKey(
                                                widget.mtfQuestions[index])
                                            ? FontWeight.w500
                                            : FontWeight.w400,
                                        fontSize: height * 0.022,
                                      )),
                                ),
                              ]),
                        ),
                      ));
                }),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(widget.mtfAnswers.length, (index) {
                  return Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.03,
                        bottom: height * 0.01,
                        top: height * 0.02,
                        right: width * 0.02,
                      ),
                      child: DragTarget(
                        onWillAccept: (data) => widget.mtfAnswers[index],
                        onAccept: (data) {
                      widget.checkMatched(data,widget.mtfAnswers[index]);
                        },
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return Container(
                            decoration: widget.matched
                                    .containsKey(widget.mtfAnswers[index])
                                ? BoxDecoration(
                                    border: Border.all(
                                      width: 4,
                                      color: Colors.green,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(height * 0.01))
                                : null,
                            child: whiteScreen(context,
                                height: height * 0.08,
                                width: width * 0.4,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.05),
                                    child: Text(widget.mtfAnswers[index],
                                        style: GoogleFonts.quicksand(
                                          color: widget.matched.containsKey(
                                                  widget.mtfAnswers[index])
                                              ? Color(0xffffa62b)
                                              : Color(0xff16697a),
                                          fontWeight: widget.matched.containsKey(
                                                  widget.mtfAnswers[index])
                                              ? FontWeight.w500
                                              : FontWeight.w400,
                                          fontSize: height * 0.022,
                                        )),
                                  ),
                                ]),
                          );
                        },
                      ));
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
*//*
*/

