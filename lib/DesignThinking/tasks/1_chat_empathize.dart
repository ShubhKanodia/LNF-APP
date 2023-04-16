import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/auth.dart';
import 'package:learnnfun/DesignThinking/commonPages/informationCard.dart';
import 'package:learnnfun/DesignThinking/widgets.dart';

import '../Persona.dart';

Color primary = Color(0xff9400d3);
Color secondary = Color(0xff1e88e5);

class EmpathizeOneOne extends StatefulWidget {
  EmpathizeOneOne({Key key}) : super(key: key);

  @override
  _EmpathizeOneOne createState() => _EmpathizeOneOne();
}

class _EmpathizeOneOne extends State<EmpathizeOneOne> {
  List<Question> questionSelected = [];
  final ScrollController _scrollController = ScrollController();
  bool _needsScroll = false;
  get currentPersona =>
      currentProgress.playingLevel2 ? currentPersonaL2 : currentPersonaL1;
  get score => currentProgress.playingLevel2 ? l2Score : l1Score;

  _scrollToEnd() async {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (_needsScroll) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());
      _needsScroll = false;
    }

    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        body: SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                children: [
                  StdBackButton(),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.13),
                    child: Text("Empathise",
                        style: GoogleFonts.signika(
                            textStyle: TextStyle(
                                color: const Color(0xff9400d3),
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: height * 0.05)),
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
              Container(
                //1
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: height * 0.07,
                          width: width * 0.15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF9c27b0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.03, right: width * 0.03),
                            child: Image.asset("assets/chatGirl.png"),
                          )),
                      // Rectangle 28
                      Container(
                        width: width * 0.7,
                        height: height * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0x338b8b8b),
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                  spreadRadius: 4)
                            ],
                            color: const Color(0xffffffff)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.03,
                                  right: width * 0.03,
                                  top: height * 0.01),
                              child: Text(
                                "Hey ${Auth().getCurrentUser().displayName}! It’s nice to meet you. I heard you wanted to get to know me. What would you like to know?",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.quicksand(
                                  color: Color(0xff1a1b41),
                                  fontSize: height * 0.018,
                                ),
                              ),
                            ),
                            Divider(
                              thickness: height * 0.001,
                              color: Colors.black,
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: currentPersona.chat.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Question question =
                                      currentPersona.chat[index];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        questionSelected.removeRange(
                                            0, questionSelected.length);
                                        questionSelected.add(question);
                                        _needsScroll = true;
                                      });
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: width * 0.7,
                                          color: questionSelected.isEmpty
                                              ? Colors.white
                                              : questionSelected[0] ==
                                                      currentPersona.chat[index]
                                                  ? Color(0xFF9c27b0)
                                                  // ? Colors.green
                                                  : Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: height * 0.016,
                                                bottom: height * 0.016,
                                                left: width * 0.01),
                                            child: Text(question.quesText,
                                                style: GoogleFonts.quicksand(
                                                    color: questionSelected
                                                            .isEmpty
                                                        ? Colors
                                                            .black // Default color
                                                        : questionSelected[0] ==
                                                                currentPersona
                                                                    .chat[index]
                                                            ? Colors
                                                                .white // Color when selected
                                                            : Colors.black,
                                                    // color:
                                                    //     const Color(0xff1a1b41),
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: height * 0.018),
                                                textAlign: TextAlign.center),
                                          ),
                                        ),
                                        Divider(
                                          thickness: height * 0.001,
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: width * 0.015,
                      ),
                    ]),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: questionSelected.length,
                itemBuilder: (BuildContext context, int index) {
                  Question qSel = questionSelected[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.02,
                      bottom: height * 0.02,
                    ),
                    child: Column(children: [
                      //2
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: height * 0.02, left: width * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 6,
                              child: Container(
                                padding: EdgeInsets.all(height * 0.01),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0x338b8b8b),
                                          offset: Offset(0, 4),
                                          blurRadius: 4,
                                          spreadRadius: 4)
                                    ],
                                    color: const Color(0xffffffff)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: width * 0.03,
                                    right: width * 0.03,
                                    top: height * 0.01,
                                  ),
                                  child: Text(
                                    qSel.quesText,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.quicksand(
                                      color: Color(0xff1a1b41),
                                      fontSize: height * 0.018,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                height: height * 0.07,
                                width: width * 0.15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff1e88e5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        //3
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  height: height * 0.07,
                                  width: width * 0.15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primary,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 0.03,
                                        right: width * 0.03),
                                    child: Image.asset("assets/chatGirl.png"),
                                  )),
                              // Rectangle 28
                              Container(
                                width: width * 0.7,
                                height: height * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0x338b8b8b),
                                          offset: Offset(0, 4),
                                          blurRadius: 4,
                                          spreadRadius: 4)
                                    ],
                                    color: const Color(0xffffffff)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: width * 0.03,
                                          right: width * 0.03,
                                          top: height * 0.01),
                                      child: Text(
                                        qSel.ansText,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff1a1b41),
                                          fontSize: height * 0.022,
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: height * 0.001,
                                      color: Colors.black,
                                    ),
                                    qSel.qFollowUp != null
                                        ? Expanded(
                                            child: ListView.builder(
                                              physics: ClampingScrollPhysics(),
                                              itemCount: qSel.qFollowUp.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int indexInner) {
                                                Question question =
                                                    qSel.qFollowUp[indexInner];
                                                print(question.ansText);
                                                return GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      questionSelected
                                                          .removeRange(
                                                              index + 1,
                                                              questionSelected
                                                                  .length);
                                                      questionSelected
                                                          .add(question);
                                                      _needsScroll = true;
                                                    });
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: width * 0.7,
                                                        color: questionSelected
                                                                .contains(
                                                                    question)
                                                            ? primary
                                                            : Colors.white,
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: height *
                                                                        0.016,
                                                                    bottom:
                                                                        height *
                                                                            0.016,
                                                                    left: width *
                                                                        0.01),
                                                            child: Text(
                                                                question
                                                                    .quesText,
                                                                style: GoogleFonts
                                                                    .quicksand(
                                                                        color: questionSelected.contains(
                                                                                question)
                                                                            ? Colors
                                                                                .white // Color when selected
                                                                            : Colors
                                                                                .black,
                                                                        // color:
                                                                        //     const Color(
                                                                        //         0xff1a1b41),
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            height *
                                                                                0.018),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center)),
                                                      ),
                                                      Divider(
                                                        thickness:
                                                            height * 0.001,
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        : Padding(
                                            padding: EdgeInsets.only(
                                                top: height * 0.02),
                                            child: StandardButton(
                                                text: "Continue",
                                                onTap: () {
                                                  score.task[1] = currentPersona
                                                          .taskMax[1] -
                                                      questionSelected.length;
                                                  if (currentProgress
                                                      .playingLevel2) {
                                                    userDocReference.update({
                                                      "rewards":
                                                          FieldValue.increment(
                                                              1),
                                                      "taskUnlocked": 10,
                                                      "L2T1": score.task[1]
                                                    });
                                                    currentProgress
                                                        .taskUnlocked = 10;
                                                    currentProgress.rewards +=
                                                        1;
                                                  } else {
                                                    userDocReference.update({
                                                      "rewards": 1,
                                                      "taskUnlocked": 2,
                                                      "L1T1": score.task[1]
                                                    });
                                                    currentProgress
                                                        .taskUnlocked = 2;
                                                    currentProgress.rewards = 1;
                                                  }

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              InformationCard(
                                                                  cardNumber:
                                                                      0),
                                                          settings: RouteSettings(
                                                              name:
                                                                  'Actual game')));
                                                }),
                                          ),
                                  ],
                                ),
                              ),
                              Container(
                                width: width * 0.015,
                              ),
                            ]),
                      )
                    ]),
                  );
                },
              ),
            ]),
          ),
        ));
  }
}

///Add a list of Questions in qFollowUp to be able to continue the chat. if there is no qFollowup, it will end there.
