import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/menupage.dart';
import 'package:learnnfun/DesignThinking/widgets.dart';

import 'BusinessModelCanvas/IntroCard.dart';
import 'BusinessModelCanvas/data.dart';
import 'BusinessModelCanvas/homeScreen.dart';
import 'DesignThinking/Persona.dart';
import 'DesignThinking/data.dart';
import 'DesignThinking/overallPages/introductionSlider.dart';
import 'DesignThinking/overallPages/levels.dart';
import 'DesignThinking/commonPages/Leaderboard.dart';
import 'auth.dart';
import 'library.dart';

class GameSelection extends StatelessWidget {
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
            child: Image.asset("assets/GameSelection.png")), ///Todo : Need to change the background and text
        Positioned(
          top: height * 0.08,
          left: width * 0.04,
          child: SquareBlueButton(
              insideImageUrl: "assets/hamburger.svg",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MenuPage(),
                        settings: RouteSettings(name: 'MenuPage')));
              }),
        ),
        Positioned(
          bottom: height * 0.1,
          right: width * 0.04,
          child: SquareBlueButton(
              insideImageUrl: "assets/leaderboard.svg",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LeaderBoard(),
                        settings: RouteSettings(name: 'Leaderboard')));
              }),
        ),
        Positioned(
          top: height * 0.08,
          right: width * 0.04,
          child: SquareBlueButton(
              insideImageUrl: "assets/library.svg",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Library(code: 0,),
                        settings: RouteSettings(name: 'Library')));
              }),
        ),
        /* Positioned(
              bottom: height * 0.2,
              left: width * 0.15,
              child: CircularOrangeButton(
                  enabled: true, number: false, text: "Start", onTap: null),
            ),*/
        Positioned(
          bottom: height * 0.33,
          right: width * 0.25,
          child: CircularOrangeButton(
              enabled: true,
              number: false,
              light: true,
              text: "Design Thinking",
              onTap: () async {
                var value = await userDocReference.get();
                if (value.data()["l1personIndex"] != null)
                  currentPersonaL1 =
                      level1Persona[value.data()["l1personIndex"]];
                if (value.data()["l2personIndex"] != null)
                  currentPersonaL2 =
                      level2Persona[value.data()["l2personIndex"]];

                if (value.data()["L1T1"] != null)
                  l1Score.task[1] = value.data()["L1T1"];
                if (value.data()["L1T2"] != null)
                  l1Score.task[2] = value.data()["L1T2"];
                if (value.data()["L1T3"] != null)
                  l1Score.task[3] = value.data()["L1T3"];
                if (value.data()["L1T4"] != null)
                  l1Score.task[4] = value.data()["L1T4"];
                if (value.data()["L1Quiz"] != null)
                  l1Score.quiz = value.data()["L1Quiz"];
                if (value.data()["L2T1"] != null)
                  l2Score.task[1] = value.data()["L2T1"];
                if (value.data()["L2T2"] != null)
                  l2Score.task[2] = value.data()["L2T2"];
                if (value.data()["L2T3"] != null)
                  l2Score.task[3] = value.data()["L2T3"];
                if (value.data()["L2T4"] != null)
                  l2Score.task[4] = value.data()["L2T4"];
                if (value.data()["L2Quiz"] != null)
                  l2Score.quiz = value.data()["L2Quiz"];
                if (value.data()["taskUnlocked"] != null &&
                    value.data()["rewards"] != null &&
                    value.data()["trophies"] != null) {
                  currentProgress.taskUnlocked = value.data()["taskUnlocked"];
                  currentProgress.rewards = value.data()["rewards"];
                  currentProgress.trophies = value.data()["trophies"];
                }
                if (currentPersonaL1 == null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IntroductionSlider(),
                        settings: RouteSettings(name: 'Introduction Slider')),

                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Levels(),
                        settings: RouteSettings(name: 'Levels')),
                  );
                }
              }),
        ),
        Positioned(
          bottom: height * 0.57,
          left: width * 0.20,
          child: CircularOrangeButton(
              enabled: true,
              number: false,
              light: true,
              text: "Business Model Canvas",
              onTap: () async {
                var value = await userDocReference.get();
                currentProgress.rewards = value.data()["rewards"];
                var farmInfoFB = await userDocReference.collection("BMCFarmFields").get();
                var farmScoresFB = await userDocReference.collection("BMCFarmScores").get();
                List<FarmLandData> farmLandInfo = List.filled(9, FarmLandData());
                if (farmInfoFB.docs.isNotEmpty){
                  farmInfoFB.docs.forEach((element) {
                    if(element.data()["deadline"]!=null)
                    farmLandInfo[int.parse(element.id)] = FarmLandData(vegetableCode: element.data()["vegetable"], deadline: DateTime.fromMillisecondsSinceEpoch(element.data()["deadline"]));
                  });
                }
                farmScoresFB.docs.forEach((element) {
                  element.data().forEach((key, value) {
                    farmScores[element.id].elementAt(int.parse(key)).selected=value;
                });
                });
                if(farmInfoFB.docs.isEmpty && farmScoresFB.docs.isEmpty){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BMCIntro(farmLandInfo: farmLandInfo,),
                        settings: RouteSettings(name: 'Business Model Canvas')),
                  );
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Farm(farmLandInfo: farmLandInfo,),
                      settings: RouteSettings(name: 'Business Model Canvas')),
                );
              }),
        ),
        /* Positioned(
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
            ),*/
      ],
    ));
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



  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
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
    );
  }
}
