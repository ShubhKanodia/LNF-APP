import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/commonPages/menupage.dart';
import 'package:learnnfun/commonPages/taskIntro.dart';
import 'package:learnnfun/commonPages/themeintro.dart';
import 'package:learnnfun/overallPages/library.dart';
import 'package:learnnfun/quiz/catchthenut.dart';
import 'package:learnnfun/tasks/0_person_list.dart';
import '../Persona.dart';
import '../auth.dart';
import 'Leaderboard.dart';
import 'courseCompletion.dart';
import 'levelEvaluation.dart';

class Levels extends StatelessWidget {
  final BaseAuth auth = Auth();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Container(
            height: height,
            width: width,
            child: Image.asset("assets/levelMap.png")),
        Positioned(
          top: height * 0.08,
          left: width * 0.04,
          child: SquareBlueButton(
              insideImageUrl: "assets/hamburger.svg", onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MenuPage(),
                    settings: RouteSettings(name: 'Actual game')));
          }),
        ),
        Positioned(
          bottom: height * 0.1,
          right: width * 0.04,
          child: SquareBlueButton( insideImageUrl: "assets/leaderboard.svg",
              onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LeaderBoard(),
                    settings: RouteSettings(name: 'Actual game')));
          }),
        ),
        Positioned(
          top: height * 0.08,
          right: width * 0.04,
          child: SquareBlueButton( insideImageUrl: "assets/library.svg",
              onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Library(),
                    settings: RouteSettings(name: 'Actual game')));
          }),
        ),
        Positioned(
          bottom: height * 0.2,
          left: width * 0.15,
          child: CircularOrangeButton(
              enabled: true, number: false, text: "Start", onTap: null),
        ),
        Positioned(
          bottom: height * 0.33,
          right: width * 0.25,
          child: CircularOrangeButton(
              enabled: true, number: true, light: currentProgress.taskUnlocked == 0, text: "1", onTap: () {
            currentProgress.playingLevel2=false;
                if(currentProgress.taskUnlocked>2)
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Tasks(),
                        settings: RouteSettings(name: 'Actual game')),
                  );

                }else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ThemeIntro(),
                          settings: RouteSettings(name: 'Actual game')));
                }
          }),
        ),
        Positioned(
          bottom: height * 0.45,
          left: width * 0.25,
          child: CircularOrangeButton(
              enabled: currentProgress.taskUnlocked >= 7, number: true, light:currentProgress.taskUnlocked == 7, text: "2", onTap: (){
                currentProgress.playingLevel2=true;
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TasksLevel2(),
                  settings: RouteSettings(name: 'Actual game')),
            );
          }),
        ),
        Positioned(
          bottom: height * 0.65,
          left: width * 0.03,
          child: CircularOrangeButton(
              enabled: currentProgress.taskUnlocked >= 15, number: false, text: "Finish", onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CourseCompletion(),
                  settings: RouteSettings(name: 'Actual game')),
            );
          }),
        ),
      ],
    ));
  }
}

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Container(
            height: height,
            width: width,
            child: Image.asset("assets/TaskMap.png")),
        Positioned(
          top: height * 0.1,
          left: width * 0.04,
          child: SquareBlueButton(
              insideImageUrl: "assets/levelIndicator.svg", onTap:() {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => Levels(),
                  settings: RouteSettings(
                      name: 'Levels')),
                  (Route<dynamic> route) => false,
            );
              }),
        ),
        Positioned(
            top: height * 0.12,
            right: -width * 0.15,
            child: Container(
                height: height * 0.05,
                width: width * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0x6616697a),
                          offset: Offset(-4, 8),
                          blurRadius: 10,
                          spreadRadius: 0)
                    ],
                    color: const Color(0xffffffff)),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.05, top: height * 0.03),
                  child: Text(
                    "Beginner",
                    style: GoogleFonts.quicksand(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: height * 0.012),
                  ),
                ))),
        Positioned(
          top: height * 0.1,
          right: -width * 0.1,
          child: Container(
              height: height * 0.05,
              width: width * 0.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xb216697a),
                        offset: Offset(-4, 4),
                        blurRadius: 8,
                        spreadRadius: 0)
                  ],
                  color: const Color(0xff16697a)),
              child: Padding(
                padding:
                    EdgeInsets.only(left: width * 0.05, top: height * 0.005),
                child: Text(
                  "Level 1",
                  style: GoogleFonts.quicksand(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: height * 0.03),
                ),
              )),
        ),
        // Rectangle 35

        Positioned(
          bottom: height * 0.12,
          left: width * 0.15,
          child: CircularOrangeButton(
              enabled: true, number: false, light:currentProgress.taskUnlocked == 0 , text: "Start", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PersonList(),
                  settings: RouteSettings(name: 'Actual game')),
            );
          }),
        ),
        Positioned(
          bottom: height * 0.24,
          right: width * 0.25,
          child: CircularOrangeButton(
              enabled: currentProgress.taskUnlocked >= 1,
              number: true,
              light: currentProgress.taskUnlocked == 1,
              text: "1", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TaskIntro(taskNumber: 0),
                  settings: RouteSettings(name: 'Actual game')),
            );
          }),
        ),
        Positioned(
            bottom: height * 0.37,
            left: width * 0.25,
            child: CircularOrangeButton(
                enabled: currentProgress.taskUnlocked >= 2,
                number: true,
                light: currentProgress.taskUnlocked == 2,
                text: "2", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TaskIntro(taskNumber: 1),
                    settings: RouteSettings(name: 'Actual game')),
              );
            })),
        Positioned(
          bottom: height * 0.49,
          right: width * 0.40,
          child: CircularOrangeButton(
              enabled: currentProgress.taskUnlocked >= 3,
              number: true,
              light: currentProgress.taskUnlocked == 3,
              text: "3", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TaskIntro(taskNumber: 2),
                  settings: RouteSettings(name: 'Actual game')),
            );
          }),
        ),
        Positioned(
          bottom: height * 0.61,
          left: width * 0.1,
          child: CircularOrangeButton(
              enabled: currentProgress.taskUnlocked >= 4,
              number: true,
              light: currentProgress.taskUnlocked == 4,
              text: "4", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TaskIntro(taskNumber: 3),
                  settings: RouteSettings(name: 'Actual game')),
            );
          }),
        ),
        Positioned(
          bottom: height * 0.62,
          right: width * 0.1,
          child: CircularOrangeButton(
              enabled: currentProgress.taskUnlocked >= 5,
              number: true,
              light: currentProgress.taskUnlocked == 5,
              text: "5", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TaskIntro(taskNumber: 4),
                  settings: RouteSettings(name: 'Actual game')),
            );
          }),
        ),
        Positioned(
          bottom: height * 0.745,
          right: width * 0.2,
          child: CircularOrangeButton(
              enabled: currentProgress.taskUnlocked >= 6, number: false,light: currentProgress.taskUnlocked == 6, text: "Quiz", onTap: () {
                currentQuizProgress.reset();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CatchTheNut(start:false),
                      settings: RouteSettings(name: 'Actual game')),
                );
              }),
        ),
        Positioned(
          bottom: height * 0.745,
          left: width * 0.2,
          child: CircularOrangeButton(
              enabled: currentProgress.taskUnlocked >= 7, number: false, text: "Finish", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LevelEvaluation(),
                  settings: RouteSettings(name: 'Actual game')),
            );
          }),
        ),
      ],
    ));
  }
}

class TasksLevel2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
          children: [
            Container(
                height: height,
                width: width,
                child: Image.asset("assets/TaskMap.png")),
            Positioned(
              top: height * 0.1,
              left: width * 0.04,
              child: SquareBlueButton(
                  insideImageUrl: "assets/levelIndicator.svg", onTap:() {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Levels(),
                      settings: RouteSettings(
                          name: 'Levels')),
                      (Route<dynamic> route) => false,
                );
              }),
            ),
            Positioned(
                top: height * 0.12,
                right: -width * 0.15,
                child: Container(
                    height: height * 0.05,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x6616697a),
                              offset: Offset(-4, 8),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ],
                        color: const Color(0xffffffff)),
                    child: Padding(
                      padding:
                      EdgeInsets.only(left: width * 0.05, top: height * 0.03),
                      child: Text(
                        "Experienced",
                        style: GoogleFonts.quicksand(
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.012),
                      ),
                    ))),
            Positioned(
              top: height * 0.1,
              right: -width * 0.1,
              child: Container(
                  height: height * 0.05,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xb216697a),
                            offset: Offset(-4, 4),
                            blurRadius: 8,
                            spreadRadius: 0)
                      ],
                      color: const Color(0xff16697a)),
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: width * 0.05, top: height * 0.005),
                    child: Text(
                      "Level 2",
                      style: GoogleFonts.quicksand(
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: height * 0.03),
                    ),
                  )),
            ),
            // Rectangle 35

            Positioned(
              bottom: height * 0.12,
              left: width * 0.15,
              child: CircularOrangeButton(
                  enabled: true, number: false, light:currentProgress.taskUnlocked == 8 , text: "Start", onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PersonList(),
                      settings: RouteSettings(name: 'Actual game')),
                );
              }),
            ),
            Positioned(
              bottom: height * 0.24,
              right: width * 0.25,
              child: CircularOrangeButton(
                  enabled: currentProgress.taskUnlocked >= 9,
                  number: true,
                  light: currentProgress.taskUnlocked == 9,
                  text: "1", onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaskIntro(taskNumber: 5),
                      settings: RouteSettings(name: 'Actual game')),
                );
              }),
            ),
            Positioned(
                bottom: height * 0.37,
                left: width * 0.25,
                child: CircularOrangeButton(
                    enabled: currentProgress.taskUnlocked >= 10,
                    number: true,
                    light: currentProgress.taskUnlocked == 10,
                    text: "2", onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TaskIntro(taskNumber: 6),
                        settings: RouteSettings(name: 'Actual game')),
                  );
                })),
            Positioned(
              bottom: height * 0.49,
              right: width * 0.40,
              child: CircularOrangeButton(
                  enabled: currentProgress.taskUnlocked >= 11,
                  number: true,
                  light: currentProgress.taskUnlocked == 11,
                  text: "3", onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaskIntro(taskNumber: 7),
                      settings: RouteSettings(name: 'Actual game')),
                );
              }),
            ),
            Positioned(
              bottom: height * 0.61,
              left: width * 0.1,
              child: CircularOrangeButton(
                  enabled: currentProgress.taskUnlocked >= 12,
                  number: true,
                  light: currentProgress.taskUnlocked == 12,
                  text: "4", onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaskIntro(taskNumber: 8),
                      settings: RouteSettings(name: 'Actual game')),
                );
              }),
            ),
            Positioned(
              bottom: height * 0.62,
              right: width * 0.1,
              child: CircularOrangeButton(
                  enabled: currentProgress.taskUnlocked >= 13,
                  number: true,
                  light: currentProgress.taskUnlocked == 13,
                  text: "5", onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaskIntro(taskNumber: 9),
                      settings: RouteSettings(name: 'Actual game')),
                );
              }),
            ),
            Positioned(
              bottom: height * 0.745,
              right: width * 0.2,
              child: CircularOrangeButton(
                  enabled: currentProgress.taskUnlocked >= 14, number: false,light: currentProgress.taskUnlocked == 14, text: "Quiz", onTap: () {
                currentQuizProgress.reset();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CatchTheNut(start:false),
                      settings: RouteSettings(name: 'Actual game')),
                );
              }),
            ),
            Positioned(
              bottom: height * 0.745,
              left: width * 0.2,
              child: CircularOrangeButton(
                  enabled: currentProgress.taskUnlocked >= 15, number: false, text: "Finish", onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LevelEvaluation(),
                      settings: RouteSettings(name: 'Actual game')),
                );
              }),
            ),
          ],
        ));
  }
}

class SquareBlueButton extends StatelessWidget {
  const SquareBlueButton({
    Key key,
    @required this.insideImageUrl,  this.onTap
  }) : super(key: key);


  final String insideImageUrl;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height:width * 0.15,
      width:width * 0.15,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xff489fb5),
              blurRadius: 1.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                2.0, // Move to bottom 10 Vertically
              ),
            )
          ],
          color: Color(0xff489fb5),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: ElevatedButton(
          child: Container(
              width: width * 0.1, child: SvgPicture.asset(insideImageUrl)),
          style: ButtonStyle(
            shadowColor: MaterialStateProperty.all<Color>(Color(0xff489fb5)),
            elevation: MaterialStateProperty.resolveWith<double>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) return 0;
                return 8; // Use the component's default.
              },
            ),
            minimumSize:
            MaterialStateProperty.all<Size>(Size(width * 0.15, width * 0.15)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return Color(0xfa489fb5);
                return Color(0xff489fb5); // Use the component's default.
              },
            ),
          ),
          onPressed: onTap),
    );
  }
}


class CircularOrangeButton extends StatelessWidget {
  CircularOrangeButton({
    Key key,
    @required this.text,
    @required this.enabled,
    @required this.number,
    this.light = false,
    @required this.onTap
  }) : super(key: key);

  final String text;
  final bool enabled;
  final  bool number;
  final bool light;
  final Function onTap;

  final ConfettiController confettiController = ConfettiController(duration : Duration(seconds:1));


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    if(light) confettiController.play();
    return ConfettiWidget(
        confettiController: confettiController,
        blastDirectionality: BlastDirectionality
            .explosive, // don't specify a direction, blast randomly
        shouldLoop:
        false, // start again as soon as the animation is finished
        colors: const [
          Colors.green,
          Colors.blue,
          Colors.pink,
          Colors.orange,
          Colors.purple
        ],
        child:  Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: light ? Color(0xfffad207) : Color(0x66cb7703),
                  blurRadius: 1.0, // soften the shadow
                  spreadRadius: 0.0, //extend the shadow
                  offset: Offset(
                    0.0, // Move to right 10  horizontally
                    2.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
              color: light ? Color(0xfffaf063) : Color(0xfffbc67e),
              borderRadius: BorderRadius.all(Radius.circular(100))),
          child: ElevatedButton(
              child: Text(
                text.toString(),
                style: GoogleFonts.quicksand(
                    color: light ? Color(0xff16697a) : Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: number ? height * 0.04 : height * 0.02),
              ),
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all<Color>(
                    light ? Color(0xfffad207) : Color(0x66cb7703)),
                elevation: MaterialStateProperty.resolveWith<double>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) return 0;
                    return 8; // Use the component's default.
                  },
                ),
                minimumSize:
                MaterialStateProperty.all<Size>(Size(width * 0.15, width * 0.15)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    )),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return enabled ? Color(0xfafbc67e) : Color(0xfffbc67e);
                    return enabled
                        ? light
                        ? Color(0xfafaf063)
                        : Color(0xffffa62b)
                        : Color(0xfffbc67e); // Use the component's default.
                  },
                ),
              ),
              onPressed: enabled?onTap:null),
        ));
  }
}

