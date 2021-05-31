import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/commonPages/informationCard.dart';

import '../auth.dart';
import '../widgets.dart';
import '../Persona.dart';

class Test extends StatefulWidget {
  const Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  double _angle = 0.0;

  double _oldAngle = 0.0;
  double _angleDelta = 0.0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        body: SafeArea(
          child: Center(
              child: Column(children: [
            backButton(context),
            Text("Test",
                style: GoogleFonts.quicksand(
                    color: const Color(0xff489fb5),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: height * 0.05)),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.2,
                  right: width * 0.2,
                  top: height * 0.03,
                  bottom: height * 0.001),
              child: Text(
                  "Pull the lever to deliver the gift and test how well you’ve done!",
                  style: GoogleFonts.quicksand(
                      color: const Color(0xff1a1b41),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: height * 0.02)),
            ),
            Container(height: height * 0.05),
            whiteScreen(context, height: height * 0.55, children: [
              GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onVerticalDragDown: (DragDownDetails details){
                    setState(() {
                        _angle = 3.14;
                    });
                    Future.delayed(Duration(seconds:1), () {
                      {
                        userDocReference.update({
                          "trophies": 0,
                          "rewards": FieldValue.increment(1),
                          "taskUnlocked":6
                        });
                        currentProgress.taskUnlocked = 6;
                        currentProgress.rewards+=1;
                        currentProgress.trophies=0;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder:
                                    (context) =>
                                    InformationCard(cardNumber: 3),
                                settings: RouteSettings(
                                    name: 'Actual game')));
                      }
                    });
                  } ,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.07,right: width * 0.07),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Transform.rotate(
                        angle: _angle,
                        child: Container(
                            height: height * 0.4,
                            child: Image.asset("assets/test/lever2.png")),
                      ),
                    ),
                  ))
            ]),
            Container(height: height * 0.05),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.2,
                  right: width * 0.2,
                  top: height * 0.001,
                  bottom: height * 0.001),
              child: Text("Drag the lever across the screen to deliver it ! ",
                  style: GoogleFonts.quicksand(
                      color: const Color(0xff1a1b41),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: height * 0.02)),
            ),
          ])),
        ));
  }
}
