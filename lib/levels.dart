import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/menupage.dart';
import 'package:learnnfun/person_list.dart';
import 'package:learnnfun/themeintro.dart';
import 'package:learnnfun/widgets.dart';

class Levels extends StatelessWidget {
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
          top: height * 0.1,
          left: width * 0.04,
          child: squareBlueButton(context,
              insideImageUrl: "assets/hamburger.svg", onTap:(){ Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MenuPage(),
                      settings: RouteSettings(name: 'Actual game')));}),
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
              enabled: true, number: true, light: true, text: "1", onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThemeIntro(),
                        settings: RouteSettings(name: 'Actual game'))); }),
        ),
        Positioned(
          bottom: height * 0.45,
          left: width * 0.25,
          child: circularOrangeButton(context,
              enabled: false, number: true, text: "2", onTap: null),
        ),
        Positioned(
          bottom: height * 0.57,
          right: width * 0.40,
          child: circularOrangeButton(context,
              enabled: false, number: true, text: "3", onTap: null),
        ),
        Positioned(
          bottom: height * 0.65,
          left: width * 0.03,
          child: circularOrangeButton(context,
              enabled: false, number: false, text: "Finish", onTap: null),
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
              child: squareBlueButton(context,
                  insideImageUrl: "assets/hamburger.svg", onTap: null),
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
                      padding: EdgeInsets.only(
                          left: width * 0.05, top: height * 0.03),
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
                    padding: EdgeInsets.only(
                        left: width * 0.05, top: height * 0.005),
                    child: Text(
                      "LEVEL 1",
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
              child: circularOrangeButton(context,
                  enabled: true, number: false, text: "Start", onTap: null),
            ),
            Positioned(
              bottom: height * 0.24,
              right: width * 0.25,
              child: circularOrangeButton(context,
                  enabled: true,
                  number: true,
                  light: true,
                  text: "1",
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PersonList(),
                          settings: RouteSettings(name: 'Actual game')),
                    );
                  }),
            ),
            Positioned(
              bottom: height * 0.37,
              left: width * 0.25,
              child: circularOrangeButton(context,
                  enabled: false, number: true, text: "2", onTap: null),
            ),
            Positioned(
              bottom: height * 0.49,
              right: width * 0.40,
              child: circularOrangeButton(context,
                  enabled: false, number: true, text: "3", onTap: null),
            ),
            Positioned(
              bottom: height * 0.61,
              left: width * 0.1,
              child: circularOrangeButton(context,
                  enabled: false, number: true, text: "4", onTap: null),
            ),
            Positioned(
              bottom: height * 0.74,
              right: width * 0.1,
              child: circularOrangeButton(context,
                  enabled: false, number: true, text: "5", onTap: null),
            ),
            Positioned(
              bottom: height * 0.74,
              left: width * 0.2,
              child: circularOrangeButton(context,
                  enabled: false, number: false, text: "Finish", onTap: null),
            ),
          ],
        ));
  }
}
