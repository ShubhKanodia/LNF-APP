import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/overallPages/courseCompletion.dart';
import 'package:learnnfun/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../Persona.dart';

class LevelEvaluation extends StatefulWidget {
  const LevelEvaluation({Key key}) : super(key: key);

  @override
  _LevelEvaluationState createState() => _LevelEvaluationState();
}

class _LevelEvaluationState extends State<LevelEvaluation> {

  final List<String> reviewDisplay=["Try again","Can do better","Well done"];
  final List<Color> reviewColor = [Color(0xffdb3333),Color(0xfffcc643),Color(0xff90ca5e)];
  Map<int,double> taskPercent= {};

  void initState(){
    for (int i=1; i<5;i++){
        taskPercent[i] = (currentPersona.taskMax[i]-l1Score.task[i])/currentPersona.taskMax[i];
    }
    double total=0;
    taskPercent.forEach((key, value) {
      total+=value;
    });
    total+=l1Score.quiz/totalQuizPossibleScore; //Adding Quiz score
    overallPercent = total/(taskPercent.length+1); //+1 for the quiz
    super.initState();
  }

  int calcTaskReview(double val){
    if(val<0.33) return 0;
    else if(val<0.66) return 1;
    else return 2;
  }

  double overallPercent;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StdBackButton(),
            Text("Level Evaluation",
            style: GoogleFonts.quicksand(
                color: const Color(0xffffa62b),
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: height * 0.05
            ),),
            WhiteScreen(
                height: height*0.7,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left:width*0.1,),
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
                  ),
                  new LinearPercentIndicator(
                    width: height*0.35,
                    lineHeight:20,
                    percent: overallPercent,
                    padding: EdgeInsets.only(left: 35),
                    backgroundColor: Colors.grey,
                    progressColor: Color(0xff489fb5),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: width*0.1),
                    child: Text((overallPercent*100).toString()+"%",
                    style: GoogleFonts.quicksand(
                      color: Color(0xff16697a),
                      fontWeight: FontWeight.w500,
                        fontStyle:  FontStyle.normal,
                        fontSize: 15,
                    ),),
                  ),
                  ListView.builder(
                      //padding: EdgeInsets.all(10),
                      itemCount: taskPercent.length,
                      itemBuilder: (BuildContext context, int index){
                        int task = taskPercent.keys.elementAt(index);
                        return Padding(
                          padding: EdgeInsets.only(left: width*0.1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Task $task",
                              style: GoogleFonts.quicksand(
                                color: Color(0xff489fb5),
                                fontWeight: FontWeight.w700,
                                fontSize: height*0.03
                              ),),
                              Padding(
                                padding: const EdgeInsets.only(left: 0,top: 10,bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: height*0.02,
                                      width: height*0.02,
                                      decoration: new BoxDecoration(
                                        color: reviewColor[calcTaskReview(taskPercent[task])],
                                        shape: BoxShape.circle,
                                      )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Text("${reviewDisplay[calcTaskReview(taskPercent[task])]}",
                                        style:GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: height*0.02,
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
                  ),
        Padding(
          padding: EdgeInsets.only(left: width*0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Quiz",
                style: GoogleFonts.quicksand(
                    color: Color(0xff489fb5),
                    fontWeight: FontWeight.w700,
                    fontSize: height*0.03
                ),),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: height*0.02,
                        width: height*0.02,
                        decoration: new BoxDecoration(
                          color: reviewColor[calcTaskReview(currentQuizProgress.score/totalQuizPossibleScore)],
                          shape: BoxShape.circle,
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text("${reviewDisplay[calcTaskReview(currentQuizProgress.score/totalQuizPossibleScore)]}",
                        style:GoogleFonts.quicksand(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: height*0.02,
                          color: Color(0xff16697a),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
                ],
              ),
            StandardButton( text: "Continue", onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CourseCompletion(),
                    settings: RouteSettings(name: 'Actual game')),
              );
            }),
          ],
        ),
      ),
    );
  }
}
