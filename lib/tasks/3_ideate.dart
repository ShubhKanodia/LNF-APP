import 'dart:async';
import 'dart:math';

import 'package:bubble_chart/bubble_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ideate extends StatefulWidget {
  @override
  _IdeateState createState() => _IdeateState();
}

class _IdeateState extends State<Ideate> {

  int time=10;
  Timer timer;
  List<Color> colors = [];

  void initState(){
    super.initState();
    colors.addAll(List.generate(ideas.length, (index) =>  Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2)));
  }

  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1),
    (Timer timer) {
      if (time == 0) {

      } else {
        setState(() {
          time--;
        });
      }
    });
  }

/// Keep first one blank for some reason
  List ideas = ["", "CD PLayer", "Earrings", "Help", "What", "WHo"];
List storedIdeas = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
              child:BubbleChartLayout(
                root: BubbleNode.node(
                  padding:30,
                  children: ideas.length==0?[]:List.generate(ideas.length, (index) => bubble(ideas[index], index, height) ),
              ),
              ),
            ),
            Container(
                height: height * 0.1,
                decoration: BoxDecoration(color: Color(0xfff4f4f4)),
            child: Text("Pop the bubbles with the best ideas",
                style: GoogleFonts.quicksand(
                    color: const Color(0xffffa62b),
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: height * 0.01),
                textAlign: TextAlign.left),),
          ],
        ))));
  }


  BubbleNode bubble(String text, int index, height) {
    print(text);
    return BubbleNode.leaf(value: index,
    options: BubbleOptions(
        onTap: () {
          if(timer==null || !timer.isActive) startTimer();
          setState(() {
            ideas.removeAt(index);
          });
          storedIdeas.add(text);
        },
      color:  colors[index],
      child:  Text(text,
                  style: GoogleFonts.quicksand(
                      color: const Color(0xff489fb5),
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: height*0.02),
                  textAlign: TextAlign.center))

    );
  }
}
