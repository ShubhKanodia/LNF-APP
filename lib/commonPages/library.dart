import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/commonPages/taskIntro.dart';
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
                      fontSize: height * 0.035,
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
                                height: height*0.2,
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(topic.title,
                                            style: GoogleFonts.quicksand(
                                            color: Color(0xff16697a),
                                            fontSize: height * 0.035,
                                            fontWeight: FontWeight.bold)),
                                    Padding(
                                      padding: EdgeInsets.only(right: width*0.06),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("BY" + topic.by,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.quicksand(
                                                color: Color(0xff16697a),
                                                fontSize: height * 0.015,)),
                                      ),
                                    ),
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
                            ListView.builder(
                              physics: AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: topic.vids,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: width*0.1,bottom: height*0.02, top: height*0.02,right: width*0.11,),
                                          child: Container(
                                            height: height * 0.2,
                                            width: width * 0.4,
                                            decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(
                                                      Radius.circular(30)
                                                      ),
                                                      boxShadow: [BoxShadow(
                                                      color: const Color(0x33000000),
                                                      offset: Offset(0,4),
                                                      blurRadius: 4,
                                                      spreadRadius: 0
                                                      )] ,
                                                      color: const Color(0xffffffff)
                                                      ),

                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: width * 0.05, right: width * 0.05),
                                                child: Image.asset("assets/play.png"),
                                              ),

                                          ),
                                        ),
                                        Text("watch more",
                                            //textAlign: TextAlign.center,
                                            style: GoogleFonts.quicksand(
                                                color: Color(0xff16697a),
                                                fontSize: height * 0.02,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                );
                              },
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
  final int vids;
  final String by;

  Topic(
      {@required this.title,
        @required this.vids,
        @required this.by,
       });
}

final topicList = [
  Topic(
    title: "EDIPT Process",
    vids: 2,
    by: "_______",
  ),
  Topic(
    title: "Design Thinking the BASICS",
    vids: 3,
      by: "_______",
  ),
  Topic(
    title: "Jessica",
    vids: 2,
    by: "_______",
  ),
  Topic(
    title: "Jessica",
    vids: 3,
    by: "_______",
  ),
];
