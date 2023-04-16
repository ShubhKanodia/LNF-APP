import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/DesignThinking/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../Persona.dart';
import '../data.dart';
import 'levels.dart';

class LevelEvaluation extends StatefulWidget {
  const LevelEvaluation({Key key}) : super(key: key);

  @override
  _LevelEvaluationState createState() => _LevelEvaluationState();
}

class _LevelEvaluationState extends State<LevelEvaluation> {
  Color primary = Color(0xff9400d3);
  Color secondary = Color(0xff16697a);
  Color tertiary = Color.fromARGB(255, 230, 211, 238);
  Color purp2 = Color.fromARGB(255, 176, 52, 228);
  get currentPersona =>
      currentProgress.playingLevel2 ? currentPersonaL2 : currentPersonaL1;
  get score => currentProgress.playingLevel2 ? l2Score : l1Score;

  final List<String> reviewDisplay = [
    "Try again",
    "Can do better",
    "Well done"
  ];
  final List<Color> reviewColor = [
    Color(0xffdb3333),
    Color(0xfffcc643),
    Color(0xff90ca5e)
  ];
  Map<int, double> taskPercent = {};

  void initState() {
    for (int i = 1; i < 5; i++) {
      taskPercent[i] = (currentPersona.taskMax[i] - score.task[i]) /
          currentPersona.taskMax[i];
    }
    double total = 0;
    taskPercent.forEach((key, value) {
      total += value;
    });
    total += score.quiz / totalQuizPossibleScore; //Adding Quiz score
    overallPercent = total / (taskPercent.length + 1); //+1 for the quiz
    super.initState();
  }

  int calcTaskReview(double val) {
    if (val < 0.33)
      return 0;
    else if (val < 0.66)
      return 1;
    else
      return 2;
  }

  double overallPercent;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.05, bottom: height * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StdBackButton(),
              Text(
                "Level Evaluation",
                style: GoogleFonts.signika(
                    color: primary,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: height * 0.05),
              ),
              WhiteScreen(
                height: height * 0.7,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.1,
                      ),
                      child: Text(
                        "ACCURACY",
                        style: GoogleFonts.signika(
                            color: primary,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.035),
                      ),
                    ),
                  ),
                  new LinearPercentIndicator(
                    width: height * 0.35,
                    lineHeight: 20,
                    percent: overallPercent,
                    padding: EdgeInsets.only(left: 35),
                    backgroundColor: tertiary,
                    progressColor: purp2,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: width * 0.1),
                    child: Text(
                      (overallPercent * 100).toStringAsFixed(2) + "%",
                      style: GoogleFonts.signika(
                        color: primary,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  ListView.builder(
                    //padding: EdgeInsets.all(10),
                    itemCount: taskPercent.length,
                    itemBuilder: (BuildContext context, int index) {
                      int task = taskPercent.keys.elementAt(index);
                      return Padding(
                        padding: EdgeInsets.only(left: width * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Task $task",
                              style: GoogleFonts.signika(
                                  color: primary,
                                  fontWeight: FontWeight.w700,
                                  fontSize: height * 0.03),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, top: 10, bottom: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      height: height * 0.02,
                                      width: height * 0.02,
                                      decoration: new BoxDecoration(
                                        color: reviewColor[
                                            calcTaskReview(taskPercent[task])],
                                        shape: BoxShape.circle,
                                      )),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: width * 0.05),
                                    child: Text(
                                      "${reviewDisplay[calcTaskReview(taskPercent[task])]}",
                                      style: GoogleFonts.signika(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: height * 0.02,
                                          color: purp2),
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
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Quiz",
                          style: GoogleFonts.signika(
                              color: primary,
                              fontWeight: FontWeight.w700,
                              fontSize: height * 0.03),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: height * 0.02,
                                  width: height * 0.02,
                                  decoration: new BoxDecoration(
                                    color: reviewColor[calcTaskReview(
                                        currentQuizProgress.score /
                                            totalQuizPossibleScore)],
                                    shape: BoxShape.circle,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.05),
                                child: Text(
                                  "${reviewDisplay[calcTaskReview(currentQuizProgress.score / totalQuizPossibleScore)]}",
                                  style: GoogleFonts.signika(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: height * 0.02,
                                    color: purp2,
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
              SizedBox(
                height: height * 0.05,
              ),
              StandardButton(
                  text: "Continue",
                  onTap: () {
                    currentProgress.trophies += 1;
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Levels(),
                          settings: RouteSettings(name: 'Levels')),
                      (Route<dynamic> route) => false,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
