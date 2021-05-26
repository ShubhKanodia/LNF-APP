import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/widgets.dart';

class Library extends StatefulWidget {
  @override
  _Library createState() => _Library();
}

class _Library extends State<Library> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                backButton(context),
                Text(
                  "Library",
                  style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          color: const Color(0xffffa62b),
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: height * 0.06)),
                ),
                Text("learn more!",
                    style: GoogleFonts.quicksand(
                      color: Color(0xff489fb5),
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.bold,
                    )),
                Expanded(
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: topicList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Topic topic =topicList[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: width*0.85,
                                height: height*0.5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: height*0, right: width*0.06),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Image.asset("designThinking.png"),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                              Text(topic.title,
                                                      style: GoogleFonts.quicksand(
                                                      color: Color(0xff16697a),
                                                      fontSize: height * 0.035,
                                                      fontWeight: FontWeight.bold)),
                                               Text("Article by "+topic.by,
                                                  style: GoogleFonts.quicksand(
                                                      color: Color(0xff16697a),
                                                      fontSize: height * 0.015, )),
                                             Row(
                                               children: [
                                                 Text("Read article",
                                                      style: GoogleFonts.quicksand(
                                                          color: Color(0xffffa62b),
                                                          fontSize: height * 0.02,
                                                          fontWeight: FontWeight.bold)),
                                                 Image.asset("assets/tag.png")
                                               ],
                                             ),
                                          ],
                                        ),
                                      ),
                                      //alignment: Alignment.centerRight,
                                    ],
                                  ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(40)
                                    ),
                                    boxShadow: [BoxShadow(
                                        color: const Color(0x33000000),
                                        offset: Offset(0,4),
                                        blurRadius: 4,
                                        spreadRadius: 0
                                    )] ,
                                    color: const Color(0xffffffff)
                                )
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class Topic {
  final String title;
  final String by;

  Topic(
      {@required this.title,
        @required this.by,
       });
}

final topicList = [
  Topic(
    title: "What is Design Thinking and why is it important?",
    by: "Rim Razzouk, Valerie Shute",
  ),
  Topic(
    title: "Design Thinking the BASICS",
      by: "_______",
  ),
  Topic(
    title: "Jessica",
    by: "_______",
  ),
  Topic(
    title: "Jessica",
    by: "_______",
  ),
];
