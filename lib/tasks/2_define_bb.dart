import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/commonPages/informationCard.dart';

import '../auth.dart';
import '../widgets.dart';

class Basketball extends StatefulWidget {
  @override
  _BasketballState createState() => _BasketballState();
}

class _BasketballState extends State<Basketball> {
  int hoopsLeft = 2;
  List<Map<String, bool>> options = [
    {"Lebron James": true, "Someone Else": false},
    {"Basketball": true, "Football": false},
  ];
  int points = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        body: SafeArea(
            child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Open Sans | 10px All
              Padding(
                padding: EdgeInsets.only(left: width * 0.06),
                child: Text("Hoops left - $hoopsLeft",
                    style: GoogleFonts.quicksand(
                        color: const Color(0xffffa62b),
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: height * 0.03),
                    textAlign: TextAlign.left),
              ),
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context))
            ],
          ),
          SizedBox(height: height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Open Sans | 10px All
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(options[options.length - hoopsLeft].keys.first,
                    style: GoogleFonts.quicksand(
                        color: const Color(0xff489fb5),
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: height * 0.04),
                    textAlign: TextAlign.left),
              ),
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(options[options.length - hoopsLeft].keys.last,
                    style: GoogleFonts.quicksand(
                        color: Color(0xff489fb5),
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: height * 0.04),
                    textAlign: TextAlign.left),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DragTarget<bool>(
                  onWillAccept: (data) => true,
                  onAccept: (data) {
                    if (options[options.length - hoopsLeft]
                        [options[options.length - hoopsLeft].keys.first]) points++;
                    if (hoopsLeft == 1) {
                      userDocReference.update({
                        "trophies":2,
                        "rewards":FieldValue.increment(points),
                        "taskUnlocked":3
                      });
                      currentProgress.taskUnlocked = 3;
                      currentProgress.rewards+=points;
                      currentProgress.trophies=2;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  InformationCard(cardNumber: 2),
                              settings: RouteSettings(name: 'Actual game')));
                    }
                    else {
                      setState(() {
                        hoopsLeft--;
                      });
                    }
                  },
                  builder: (
                    BuildContext context,
                    List<dynamic> accepted,
                    List<dynamic> rejected,
                  ) {
                    return Container(
                        height: height * 0.5,
                        child: Image.asset("assets/basketball/hoop.png"));
                  }),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.3),
                    child: Text(
                      "Shoot",
                      style: GoogleFonts.quicksand(
                          color: const Color(0xff1a1b41),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: height * 0.02),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          height: height * 0.08,
                          child: Image.asset("assets/basketball/arrow.png")),
                      Container(
                        height: height * 0.08,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(pi),
                          child: Image.asset("assets/basketball/arrow.png"),
                        ),
                      )
                    ],
                  )
                ],
              ),
              DragTarget<bool>(
                onWillAccept: (data) => true,
                onAccept: (data) {
                  if (options[options.length - hoopsLeft][options[options.length - hoopsLeft].keys.last])
                    points++;
                  if (hoopsLeft == 1) {
                    userDocReference.update({
                      "trophies": 2,
                      "rewards": FieldValue.increment(points),
                      "taskUnlocked":3
                    });

                    currentProgress.taskUnlocked = 3;
                    currentProgress.rewards+=points;
                    currentProgress.trophies=2;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                InformationCard(cardNumber: 2),
                            settings: RouteSettings(name: 'Actual game')));
                  }//TODO : Go to some other page
                  else {
                    setState(() {
                      hoopsLeft--;
                    });
                  }
                },
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Container(
                    height: height * 0.5,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: Image.asset("assets/basketball/hoop.png"),
                    ),
                  );
                },
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.25, right: width * 0.25),
            child: Draggable(
              data: true,
              childWhenDragging: Container(),
              feedback: Container(
                height: height * 0.2,
                width: width * 0.4,
                child: Image.asset("assets/basketball/basketball.png"),
              ),
              child: Container(
                height: height * 0.2,
                width: width * 0.4,
                child: Image.asset("assets/basketball/basketball.png"),
              ),
            ),
          )
        ])));
  }
}
