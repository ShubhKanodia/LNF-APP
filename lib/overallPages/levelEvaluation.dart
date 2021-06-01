import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LevelEvaluation extends StatefulWidget {
  const LevelEvaluation({Key key}) : super(key: key);

  @override
  _LevelEvaluationState createState() => _LevelEvaluationState();
}

class _LevelEvaluationState extends State<LevelEvaluation> {
  @override
  final List<String> EvaluationStrings=["can do better","well done","try again","Great"];
  final List<int> NoOfTasks=<int>[1,2,3,4];
  var prcnt=0.5;
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:10),
              child: backButton(context),
            ),
            Text("Level Evaluation",
            style: GoogleFonts.quicksand(
                color: const Color(0xffffa62b),
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: height * 0.05
            ),),
            Padding(
              padding: const EdgeInsets.only(top:10,bottom:12),
              child: Container(
                  width: height*0.38,
                  height: height*0.68,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height * 0.08),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x338b8b8b),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Colors.white,
                  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:30,left:35,bottom: 15),
                      child: Text(
                        "ACCURACY",
                        style:GoogleFonts.quicksand(
                            color: const Color(0xff16697a),
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.035
                        ),
                      ),
                    ),
                    new LinearPercentIndicator(
                      width: height*0.35,
                      lineHeight:20,
                      percent: prcnt,
                      padding: EdgeInsets.only(left: 35),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.blue,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(right: 10,bottom: 20,top:15),
                      child: Text((prcnt*100).toString()+"%",
                      style: GoogleFonts.quicksand(
                        color: Color(0xff16697a),
                        fontWeight: FontWeight.w500,
                          fontStyle:  FontStyle.normal,
                          fontSize: 15,
                      ),),
                    ),
                    ListView.builder(
                        //padding: EdgeInsets.all(10),
                        itemCount: NoOfTasks.length,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.only(left: 35,top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Task ${NoOfTasks[index]}",
                                style: GoogleFonts.quicksand(
                                  color: Color(0xff489fb5),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25
                                ),),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0,top: 10,bottom: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 20.0,
                                        width: 20.0,
                                        decoration: new BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle,
                                        )
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 30),
                                        child: Text("${EvaluationStrings[index]}",
                                          style:GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 20,
                                            color: Color(0xff16697a),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      shrinkWrap: true,
                    )
                  ],
                ),
              ),
            ),
            StandardButton( text: "Continue", onTap: (){}),
          ],
        ),
      ),
    );
  }
}
