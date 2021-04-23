import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/completedPage.dart';
import 'package:learnnfun/taskIntro.dart';
import 'package:learnnfun/widgets.dart';

class EmpathizeOneOne extends StatefulWidget {
  EmpathizeOneOne({Key key}) : super(key: key);

  @override
  _EmpathizeOneOne createState() => _EmpathizeOneOne();
}

class _EmpathizeOneOne extends State<EmpathizeOneOne> {
  List<Question> questionSelected = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      backButton(context),
                      Text("Empathise",
                          style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                  color: const Color(0xff489fb5),
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: height * 0.05)),
                          textAlign: TextAlign.center),
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
                                color: Color(0xffffa62b),
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
                                    "Hey John! It’s nice to meet you. I heard you wanted to get to know me. What would you like to know?",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.quicksand(
                                      color: Color(0xff1a1b41),
                                      fontSize: height * 0.018,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: questionList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Question question = questionList[index];
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            questionSelected.removeRange(0, questionSelected.length);
                                            questionSelected.add(question);
                                          });
                                        },
                                        child: Container(
                                          color: questionSelected.isEmpty?Colors.white:questionSelected[0] == questionList[index]
                                              ? Colors.green
                                              : Colors.white,
                                          child: Text(question.quesText,
                                              style: GoogleFonts.quicksand(
                                                  color: const Color(0xff1a1b41),
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: height * 0.018),
                                              textAlign: TextAlign.center),
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
                        padding: EdgeInsets.only(top:height*0.02, bottom:height*0.02,),
                        child: Column(

                            children: [
                          //2
                          Padding(
                            padding: EdgeInsets.only(bottom:height*0.02,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                Container(

                                  width: width * 0.75,
                                  height: height * 0.05,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0x338b8b8b),
                                            offset: Offset(0, 4),
                                            blurRadius: 4,
                                            spreadRadius: 4)
                                      ],
                                      color: const Color(0xffffffff)),
                                  child:Row(
                                          children: [
                                            Padding(
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

                                          ],
                                        ),
                                ),
                                    Container(
                                      height: height * 0.07,
                                      width: width * 0.15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff489fb5),
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
                                        color: Color(0xffffa62b),
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
                                                    color: Color(0xff1a1b41),
                                                    fontSize: height * 0.018,
                                                  ),
                                                ),
                                              ),
                                              qSel.qFollowUp!=null?Expanded(
                                                child: ListView.builder(
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

                                                          questionSelected.removeRange(index+1, questionSelected.length);
                                                          questionSelected.add(question);
                                                        });
                                                      },
                                                      child: Container(
                                                        color: questionSelected.contains(question)
                                                            ? Colors.green
                                                            : Colors.white,
                                                        child: Text(
                                                            question.quesText,
                                                            style: GoogleFonts
                                                                .quicksand(
                                                                    color: const Color(
                                                                        0xff1a1b41),
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    fontSize:
                                                                        height *
                                                                            0.018),
                                                            textAlign:
                                                                TextAlign.center),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ):button(context, text: "Continue", onTap: (){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => TaskCompleted(task: true, trophies: 1, rewards: 1, onTap: (){
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => TaskIntro(taskNumber: 1),
                                                                settings: RouteSettings(name: 'Task 2')));
                                                      },),
                                                      settings: RouteSettings(name: 'Task Completed')),
                                                );
                                              }),
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
        )));
  }
}

class Question {
  final String quesText;
  final String ansText;
  final List<Question> qFollowUp;

  Question({
    @required this.quesText,
    @required this.ansText,
    this.qFollowUp,
  });
}

final questionList = [
  Question(
    quesText: "What sport do you like to play the most?",
    ansText:
        "I like to play basketball",
    qFollowUp: [
      Question(
          quesText: "Which position do you play",
          ansText: 'Center',
          qFollowUp: [
            Question(ansText: 'Ok', quesText: 'Nice'),
          ]),
      Question(
          quesText: "Which player do you like?",
          ansText: 'Lebron James',
          qFollowUp: [
            Question(ansText: 'Ok', quesText: 'Nice'),
          ]),
      Question(
          quesText: "How often do you watch it ",
          ansText: 'Regularly',
          qFollowUp: [
            Question(ansText: 'Ok', quesText: 'Nice'),
          ]),
    ],
  ),
  Question(
    quesText: "What do you like to do in your free time?",
    ansText:
        "I like to read, sometimes I like to paint and occasionally I sing at open mics.",
    qFollowUp: [
      Question(
          quesText: "What kind of books do you like to read?",
          ansText: '',
          qFollowUp: [
            Question(ansText: '', quesText: ''),
            Question(ansText: '', quesText: ''),
            Question(ansText: '', quesText: '')
          ]),
      Question(
          quesText: "Do you like the mystery genre?",
          ansText: '',
          qFollowUp: [
            Question(ansText: '', quesText: ''),
            Question(ansText: '', quesText: ''),
            Question(ansText: '', quesText: '')
          ]),
      Question(
          quesText: "Have you read Agatha Christie?",
          ansText: '',
          qFollowUp: [
            Question(ansText: '', quesText: ''),
            Question(ansText: '', quesText: ''),
            Question(ansText: '', quesText: '')
          ]),
    ],
  ),
  Question(
    quesText: "Do you like to play sports?",
    ansText:
        "I like to read, sometimes I like to paint and occasionally I sing at open mics.",
    qFollowUp: [
      Question(
          quesText: "What kind of books do you like to read?",
          ansText: '',
          qFollowUp: [
            Question(ansText: '', quesText: ''),
            Question(ansText: '', quesText: ''),
            Question(ansText: '', quesText: '')
          ]),
      Question(
          quesText: "Do you like the mystery genre?",
          ansText: '',
          qFollowUp: [
            Question(ansText: '', quesText: ''),
            Question(ansText: '', quesText: ''),
            Question(ansText: '', quesText: '')
          ]),
      Question(
          quesText: "Have you read Agatha Christie?",
          ansText: '',
          qFollowUp: [
            Question(ansText: '', quesText: ''),
            Question(ansText: '', quesText: ''),
            Question(ansText: '', quesText: '')
          ]),
    ],
  ),
];
