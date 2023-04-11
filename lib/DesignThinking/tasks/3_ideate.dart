import 'dart:async';
import 'dart:math';

import 'package:bubble_chart/bubble_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/DesignThinking/commonPages/informationCard.dart';
import 'package:learnnfun/DesignThinking/widgets.dart';

import 'package:learnnfun/auth.dart';
import '../Persona.dart';

class Ideate extends StatefulWidget {
  @override
  _IdeateState createState() => _IdeateState();
}

class _IdeateState extends State<Ideate> {
  get currentPersona =>
      currentProgress.playingLevel2 ? currentPersonaL2 : currentPersonaL1;
  get score => currentProgress.playingLevel2 ? l2Score : l1Score;
  int time = 5;
  Timer timer;
  List<Color> colors = [];

  void initState() {
    super.initState();
    colors.addAll(List.generate(
        currentPersona.ideas.length,
        (index) => Color((Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(0.2)));
  }

  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (time == 0 || currentPersona.ideas.length == 0) {
        timer.cancel();
        if (currentProgress.playingLevel2) {
          userDocReference.update({
            "rewards": FieldValue.increment(1),
            "taskUnlocked": 12,
            "L2T3": l2Score.task[3],
          });

          currentProgress.taskUnlocked = 12;
          currentProgress.rewards += 1;
        } else {
          userDocReference.update({
            "rewards": FieldValue.increment(1),
            "taskUnlocked": 4,
            "L1T3": l1Score.task[3],
          });

          currentProgress.taskUnlocked = 4;
          currentProgress.rewards += 1;
        }

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InformationCard(cardNumber: 2),
                settings: RouteSettings(name: 'Actual game')));
      } else {
        setState(() {
          time--;
        });
      }
    });
  }

  /// Keep first one blank for some reason

  List storedIdeas = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        body: SafeArea(
            child: Center(
                child: Column(
          children: [
            Container(
                height: height * 0.1,
                decoration: BoxDecoration(color: Color(0xfff4f4f4)),
                child: Row(
                  children: [
                    Text("Time left- $time seconds",
                        style: GoogleFonts.quicksand(
                            color: const Color(0xffffa62b),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.04),
                        textAlign: TextAlign.left),
                    IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.pop(context))
                  ],
                )),
            Expanded(
              child: BubbleChartLayout(children: [
                BubbleNode.node(
                  padding: 20,
                  children: currentPersona.ideas.length == 0
                      ? []
                      : List.generate(
                          currentPersona.ideas.length,
                          (index) => bubble(
                              currentPersona.ideas.keys.elementAt(index),
                              index,
                              height)),
                ),
              ]),
            ),
            Container(
              width: width,
              height: height * 0.1,
              decoration: BoxDecoration(color: Color(0xfff4f4f4)),
              child: Text("Pop the bubbles with the best ideas",
                  style: GoogleFonts.quicksand(
                      color: const Color(0xffffa62b),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: height * 0.028),
                  textAlign: TextAlign.left),
            ),
          ],
        ))));
  }

  BubbleNode bubble(String text, int index, height) {
    return BubbleNode.leaf(
        value: 1000,
        options: BubbleOptions(
            onTap: () {
              if (timer == null || !timer.isActive) startTimer();
              score.task[3] = 0;
              if (currentPersona.ideas[text] == true) score.task[3]++;
              if (currentPersona.ideas[text] == false) score.task[3]--;
              setState(() {
                currentPersona.ideas.remove(text);
              });
              storedIdeas.add(text);
            },
            color: colors[index],
            child: Text(text,
                style: GoogleFonts.quicksand(
                    color: const Color(0xff489fb5),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: height * 0.02),
                textAlign: TextAlign.center)));
  }
}

class Ideate2 extends StatefulWidget {
  @override
  _Ideate2State createState() => _Ideate2State();
}

class _Ideate2State extends State<Ideate2> {
  Timer timer;
  int time = 20; //TODO : Change to 300
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (time == 0 && mounted) {
        timer.cancel();
        userDocReference
            .update({"rewards": FieldValue.increment(1), "taskUnlocked": 4});

        currentProgress.taskUnlocked = 4;
        currentProgress.rewards += 1;

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InformationCard(cardNumber: 2),
                settings: RouteSettings(name: 'Actual game')));
      } else {
        setState(() {
          time--;
        });
      }
    });
  }

  TextEditingController idea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        body: Center(
            child: Column(
          children: [
            StdBackButton(),
            Text("Ideate",
                style: GoogleFonts.quicksand(
                    color: const Color(0xff489fb5),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: height * 0.05)),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.2,
                  right: width * 0.2,
                  top: height * 0.001,
                  bottom: height * 0.001),
              child: Text(
                  "List all the ideas you come up with for gifts in the next 5 minutes. The timer will begin once you tap on the page.",
                  style: GoogleFonts.quicksand(
                      color: const Color(0xff1a1b41),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: height * 0.02)),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Svg('assets/ideation/notepad.svg'),
                      fit: BoxFit.fill),
                ),
                child: TextField(
                  onTap: startTimer,
                  controller: idea,
                  keyboardType: TextInputType.multiline,
                  minLines: 1, //Normal textInputField will be displayed
                  maxLines: 10,
                  style: TextStyle(
                    height: MediaQuery.of(context).viewInsets.bottom == 0
                        ? height * 0.0028
                        : height * 0.0013,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: width * 0.15,
                        right: width * 0.1,
                        top: height * 0.04,
                        bottom: height * 0.02),
                    hintText: "Type here...",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  time > 60
                      ? time % 60 > 10
                          ? "Time left- ${(time ~/ 60)}:${(time % 60)} minutes"
                          : "Time left- ${(time ~/ 60)}:0${(time % 60)} minutes"
                      : "Time left- $time seconds",
                  style: GoogleFonts.quicksand(
                      color: const Color(0xffffa62b),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: height * 0.04),
                  textAlign: TextAlign.left),
            ),
          ],
        )));
  }
}
