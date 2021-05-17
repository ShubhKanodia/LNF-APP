import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/widgets.dart';

class MsQuizb extends StatefulWidget {
  @override
  _MsQuizb createState() => _MsQuizb();
}

class _MsQuizb extends State<MsQuizb> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var index=0;
    bool pressed=false;
    Question ques =quesList[index];

    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                backButton(context),
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
                      child: Container(
                          width: width*0.85,
                          height: height*0.15,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: width*0.02,right:width*0.02, ),
                                child: Text(ques.question,
                                    style: GoogleFonts.quicksand(
                                      color: Color(0xffffa62b),
                                      fontSize: height * 0.025,)),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20)
                              ),
                              boxShadow: [BoxShadow(
                                  color: const Color(0x33000000),
                                  offset: Offset(0,4),
                                  blurRadius: 4,
                                  spreadRadius: 0
                              )] ,
                              color: const Color(0xffffffff)
                          )
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
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            pressed=!pressed;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: width*0.03,bottom: height*0.01, top: height*0.02,right: width*0.02,),
                          child: Container(
                            height: height * 0.15,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20)
                                ),
                                boxShadow: [BoxShadow(
                                    color: const Color(0x33000000),
                                    offset: Offset(0,4),
                                    blurRadius: 4,
                                    spreadRadius: 0
                                )] ,
                                color: const Color(0xffffffff)
                            ),

                            child: Padding(
                              padding: EdgeInsets.only(top:height*0.035,left: width * 0.05, right: width * 0.05),
                                    child: Text(ques.A,
                                    style: GoogleFonts.quicksand(
                                    color: pressed?Color(0xffffa62b):Color(0xff16697a),
                                    fontSize: height * 0.02,)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width*0.02,bottom: height*0.02, top: height*0.02,right: width*0.03,),
                        child: Container(
                          height: height * 0.15,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20)
                              ),
                              boxShadow: [BoxShadow(
                                  color: const Color(0x33000000),
                                  offset: Offset(0,4),
                                  blurRadius: 4,
                                  spreadRadius: 0
                              )] ,
                              color: const Color(0xffffffff)
                          ),

                          child: Padding(
                            padding: EdgeInsets.only(top:height*0.035,left: width * 0.05, right: width * 0.05),
                            child: Text(ques.B,
                                style: GoogleFonts.quicksand(
                                  color: Color(0xff16697a),
                                  fontSize: height * 0.02,)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width*0.03,bottom: height*0.02, top: height*0.02,right: width*0.02,),
                        child: Container(
                          height: height * 0.15,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20)
                              ),
                              boxShadow: [BoxShadow(
                                  color: const Color(0x33000000),
                                  offset: Offset(0,4),
                                  blurRadius: 4,
                                  spreadRadius: 0
                              )] ,
                              color: const Color(0xffffffff)
                          ),

                          child: Padding(
                            padding: EdgeInsets.only(top:height*0.035,left: width * 0.05, right: width * 0.05),
                            child: Text(ques.C,
                                style: GoogleFonts.quicksand(
                                  color: Color(0xff16697a),
                                  fontSize: height * 0.02,)),
                          ),

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width*0.02,bottom: height*0.02, top: height*0.02,right: width*0.03,),
                        child: Container(
                          height: height * 0.15,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20)
                              ),
                              boxShadow: [BoxShadow(
                                  color: const Color(0x33000000),
                                  offset: Offset(0,4),
                                  blurRadius: 4,
                                  spreadRadius: 0
                              )] ,
                              color: const Color(0xffffffff)
                          ),

                          child: Padding(
                            padding: EdgeInsets.only(top:height*0.035,left: width * 0.05, right: width * 0.05),
                            child: Text(ques.D,
                                style: GoogleFonts.quicksand(
                                  color: Color(0xff16697a),
                                  fontSize: height * 0.02,)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:height*0.035, bottom:height*0.015,),
                    child: Container(
                      height: height * 0.07,
                      width: width * 1,
                      color: Color(0xff90ca5e),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(top:height*0.005,left: width * 0.05, right: width * 0.05),
                          child: Text("You're Right!",
                              style: GoogleFonts.quicksand(
                                color: Color(0xffffffff),
                                fontSize: height * 0.035,
                                fontWeight: FontWeight.bold,)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
                button(context, text: "Check", onTap: () {

                })
              ],
            ),
          ),
        ));
  }
}

class Question {
  final String question;
  final String A;
  final String B;
  final String C;
  final String D;
  final String ans;

  Question(
      {@required this.question,
        @required this.A,
        @required this.B,
        @required this.C,
        @required this.D,
        @required this.ans
      });
}

final quesList = [
  Question(
    question: "What are the steps of Design Thinking Process?",
    A: "Understand > Draw > Ideate > Create > Test",
    B: "Empathise > Define > Ideate > Prototype > Test",
    C: "Empathise > Design > Implement > Produce > Test",
    D: "Understand > Define > Ideate > Produce > Try",
    ans: "B",
  ),
  Question(
    question: "What are the three elements of Innovation?",
    A: "Desirability, Feasibility, Viability ",
    B: "Originality, Profitability, Technicality",
    C: "Originality, Feasibility, Technicality",
    D: "Desirability, Profitability, Viability",
    ans: "A",
  ),
  Question(
    question: "Which one of the following does NOT resonate with the Empathy Stage?",
    A: "Personal interviews with users",
    B: "Seek to understand users",
    C: "Shadowing the users",
    D: "Mock-up of the solution",
    ans: "D",
  ),
  Question(
    question: "Which of the below is incorrect?",
    A: "PepsiCo has turned Design Thinking into its strategy",
    B: "GE Healthcare has built a MR scanner for children using Design Thinking",
    C: "AirBnB avoided bankruptcy and turned profitable using Design Thinking",
    D: "All of the above are correct",
    ans: "D",
  ),
];
