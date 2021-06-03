import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/Persona.dart';
import 'package:learnnfun/overallPages/levelEvaluation.dart';
import 'package:learnnfun/quiz/quizIntro.dart';

import '../auth.dart';
import '../widgets.dart';

class CatchTheNut extends StatefulWidget {
  CatchTheNut({Key key, @required this.start}) : super(key: key);

  final bool start;
  @override
  _CatchTheNutState createState() => _CatchTheNutState();
}

class _CatchTheNutState extends State<CatchTheNut> {
  Timer timer;
  NutDetails nut1 = NutDetails(1);
  NutDetails nut2 = NutDetails(2);
  NutDetails nut3 = NutDetails(3);
  bool correct;
  double height;
  int currentOptionCount = 2; //Needs to be one less than the number of nuts defined
  final double speed = 1.6; //Keep value below 2
  final int timeLagInSeconds = 3;

  void initState() {
    if(widget.start) {
      nut1.visible = true;
      timer = Timer.periodic(Duration(milliseconds: 20), (timer) {
        if (mounted) {
          setState(() {
            if (nut1.visible) nut1.top += speed;
            if (nut1.top > height * 0.8) {
              nut1.next(currentOptionCount);
              currentOptionCount++;
            }
            if (nut2.visible) nut2.top += speed;
            if (nut2.top > height * 0.8) {
              nut2.next(currentOptionCount);
              currentOptionCount++;
            }
            if (nut3.visible) nut3.top += speed;
            if (nut3.top > height * 0.8) {
              nut3.next(currentOptionCount);
              currentOptionCount++;
            }
          });
        }

        ///Control to finish
        if (!nut1.visible && !nut2.visible && !nut3.visible) {
          timer.cancel();
          Future.delayed(Duration(seconds: correct==null?timeLagInSeconds:0), ()
          {
            if (currentQuizProgress.currentQuestionNumber + 1 <
                catchTheNutMap.length) {
              currentQuizProgress.currentQuestionNumber += 1;
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => CatchTheNut(start: true),
                  settings: RouteSettings(name: 'Tasks')),);
            } else {
              userDocReference.update({
                "trophies": 1,
                "taskUnlocked": 7,
                "rewards": FieldValue.increment(currentQuizProgress.score),
                "L1Quiz" : currentQuizProgress.score
              });
              currentProgress.taskUnlocked = 7;
              currentProgress.rewards += currentQuizProgress.score;
              currentProgress.trophies = 1;
              l1Score.quiz = currentQuizProgress.score;
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => LevelEvaluation(),
                  settings: RouteSettings(name: 'Tasks')),);
            }
          });
        }
      });

      Future.delayed(Duration(seconds: timeLagInSeconds), () {
        nut2.visible = true;
        Future.delayed(Duration(seconds: timeLagInSeconds), () {
          nut3.visible = true;
        });
      });
    }else{
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        showDialog(context: context, builder: (context){
          return QuizIntro(name: 'Catch the Correct Nuts',text2: "Match the following",text3: "Move the Squirrel to catch the correct answers!\n\nCatch all the correct answers to finish the game.",);
        });
      });

    }
    super.initState();
  }

  void nutHit(NutDetails nut) {
    if(nut.correct){
      currentQuizProgress.score++;
    }else{
      currentQuizProgress.score--;
    }
    print("Nut hit");
    correct = nut.correct;
    nut.visible = false;
    nut.next(currentOptionCount);
    currentOptionCount++;
    Future.delayed(Duration(seconds: timeLagInSeconds), () {
      correct = null;
    });
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
          child: Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/quiz/Background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StdBackButton(),
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
                                        "Catch the nuts",
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
                                      "Have Fun",
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
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.31, vertical: height * 0.04),
                    child: Text(
                        catchTheNutMap.entries.elementAt(currentQuizProgress.currentQuestionNumber).key,
                        style: GoogleFonts.quicksand(
                            color: const Color(0xff1a1b41),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.023),
                        textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          left: width * 0.6,
                          top: nut1.top,
                          child: Visibility(
                            visible: nut1.visible,
                            child: Transform.rotate(
                                angle: nut1.angle,
                                child: _Nut(
                                    height: height, nut: nut1, nutHit: nutHit)),
                          ),
                        ),
                        Positioned(
                          left: width * 0.4,
                          top: nut2.top,
                          child: Visibility(
                            visible: nut2.visible,
                            child: Transform.rotate(
                                angle: nut2.angle,
                                child: _Nut(
                                    height: height, nut: nut2, nutHit: nutHit)),
                          ),
                        ),
                        Positioned(
                          left: width * 0.1,
                          top: nut3.top,
                          child: Visibility(
                            visible: nut3.visible,
                            child: Transform.rotate(
                                angle: nut3.angle,
                                child: _Nut(
                                    height: height, nut: nut3, nutHit: nutHit)),
                          ),
                        ),
                        Positioned(
                          right:-10,
                          top:0,
                          child: QuizProgressBar(width: width, height: height)),
                        // Ellipse 42
                        Positioned(
                          bottom: 0,
                          child: Draggable(
                              axis: Axis.horizontal,
                              data: true,
                              childWhenDragging: Container(),
                              feedback: SvgPicture.asset(
                                "assets/quiz/squirrel.svg",
                                height: height * 0.2,
                              ),
                              child: SvgPicture.asset(
                                "assets/quiz/squirrel.svg",
                                height: height * 0.2,
                              )),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Visibility(
                            visible: correct != null,
                            child: _AnswerBar(
                                width: width, height: height, correct: correct),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))),
        ));
  }
}

class QuizProgressBar extends StatelessWidget {
  const QuizProgressBar({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width*0.2,
      height:height*0.4,
        /*decoration: BoxDecoration(
          boxShadow: [BoxShadow(
              color: const Color(0x33000000),
              offset: Offset(2,4),
              blurRadius: 10,
              spreadRadius: 0
          )]), */
      child: RotatedBox(
        quarterTurns: -1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
              BorderRadius.all(Radius.circular(100)),
              child: Container(
                  width: width*0.1,
                  height: width*0.1,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xffffa62b),
                          width: 4
                      ),
                      boxShadow: [BoxShadow(
                          color: const Color(0x40000000),
                          offset: Offset(3,4),
                          blurRadius: 8,
                          spreadRadius: 0
                      )] ,
                      color: const Color(0xffffa62b)
                  )
              ),
            ),
            Expanded(
              child: ClipRRect(
                  borderRadius:
                  BorderRadius.all(Radius.circular(15)),
                child: LinearProgressIndicator(
                  minHeight: height*0.02,
                  backgroundColor: Color(0xfff8eddf),
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xffffa62b)),
                  value: currentQuizProgress.score /3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnswerBar extends StatelessWidget {
  const _AnswerBar({
    Key key,
    @required this.width,
    @required this.height,
    @required this.correct,
  }) : super(key: key);

  final double width;
  final double height;
  final bool correct;

  @override
  Widget build(BuildContext context) {
    if (correct)
      return Container(
        width: width,
        height: height * 0.2,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              const Color(0x00ffffff),
              const Color(0xa990ca5e),
              const Color(0xff6c9b5e)
            ])),
        child: // Open Sans | 12px - r
            Padding(
          padding: EdgeInsets.only(bottom: height * 0.035),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text("You’re Right!",
                style: GoogleFonts.quicksand(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: height * 0.04),
                textAlign: TextAlign.center),
          ),
        ),
      );
    else
      return Container(
        width: width,
        height: height * 0.2,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              const Color(0x00ffffff),
              const Color(0x7adb3333),
              const Color(0xffb94d27)
            ])),
        child: // Open Sans | 12px - r
            Padding(
          padding: EdgeInsets.only(bottom: height * 0.035),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text("Oh no! That's wrong",
                style: GoogleFonts.quicksand(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: height * 0.04),
                textAlign: TextAlign.center),
          ),
        ),
      );
  }
}

class _Nut extends StatelessWidget {
  const _Nut(
      {Key key,
      @required this.height,
      @required this.nutHit,
      @required this.nut})
      : super(key: key);

  final NutDetails nut;
  final double height;
  final Function nutHit;

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      onWillAccept: (data) {
        nutHit(nut);
        return true;
      },
      onAccept: (data) {},
      builder: (BuildContext context, List<Object> candidateData,
          List<dynamic> rejectedData) {
        return Column(
          children: [
            Text(nut.name,
                style: GoogleFonts.quicksand(
                    color: const Color(0xff1a1b41),
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: height * 0.02),
                textAlign: TextAlign.center),
            SvgPicture.asset(
              "assets/quiz/nut.svg",
              height: height * 0.1,
            ),
          ],
        );
      },
    );
  }
}

class NutDetails {
  String name;
  int number;
  double top;
  bool visible = false;
  bool correct;
  double angle;

  NutDetails(this.number) {
    Map<String, bool> currentQuestion =
        catchTheNutMap.entries.elementAt(currentQuizProgress.currentQuestionNumber).value;
    this.name = currentQuestion.keys.elementAt(number - 1);
    this.top = 0;
    this.visible = false;
    this.correct = currentQuestion.values.elementAt(number - 1);
    this.angle = Random().nextDouble();
  }

  void next(int currentOptionCount) {
    Map<String, bool> currentQuestion =
        catchTheNutMap.entries.elementAt(currentQuizProgress.currentQuestionNumber).value;
    if (currentOptionCount + 1 < currentQuestion.keys.length) {
      this.name = currentQuestion.keys.elementAt(currentOptionCount + 1);
      this.correct = currentQuestion[this.name];
      this.top = 0;
      this.angle = Random().nextDouble() * (Random().nextBool()?-1:1);
      this.visible = true;
    } else {
      this.top = 0;
      this.visible = false;
    }
  }
}

//
