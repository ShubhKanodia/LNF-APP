import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnnfun/widgets.dart';

class Levels extends StatefulWidget {
  @override
  _LevelsState createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0x1A489fb5),
        body: Stack(
          children: [
            Container(
                height: height,
                width: width,
                child: Image.asset("assets/levelMap.png")),
            Positioned(
              top: height * 0.1,
              left: width * 0.04,
              child: squareBlueButton(context,
                  insideImageUrl: "assets/hamburger.svg", onTap: null),
            ),
            Positioned(
              bottom: height * 0.1,
              left: width * 0.04,
              child: squareBlueButton(context,
                  insideImageUrl: "assets/hamburger.svg", onTap: null),
            ),
            Positioned(
              top: height * 0.1,
              right: width * 0.04,
              child: squareBlueButton(context,
                  insideImageUrl: "assets/hamburger.svg", onTap: null),
            ),
            Positioned(
              bottom: height * 0.1,
              right: width * 0.04,
              child: squareBlueButton(context,
                  insideImageUrl: "assets/hamburger.svg", onTap: null),
            ),
            Positioned(
              bottom: height * 0.2,
              left: width * 0.15,
              child: circularOrangeButton(context,
                  enabled: true, number: false, text: "Start", onTap: null),
            ),
            Positioned(
              bottom: height * 0.33,
              right: width * 0.25,
              child: circularOrangeButton(context,
                  enabled: true,
                  number: true,
                  light: true,
                  text: "1",
                  onTap: null),
            ),
            Positioned(
              bottom: height * 0.33,
              right: width * 0.25,
              child: circularOrangeButton(context,
                  enabled: true,
                  number: true,
                  light: true,
                  text: "1",
                  onTap: null),
            ),
            Positioned(
              bottom: height * 0.45,
              left: width * 0.25,
              child: circularOrangeButton(context,
                  enabled: false, number: true, text: "2", onTap: null),
            ),
          ],
        ));
  }
}

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
