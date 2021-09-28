import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/quiz/catchthenut.dart';
import 'package:learnnfun/overallPages/levels.dart';
import 'package:learnnfun/widgets.dart';
import '../Persona.dart';

class TaskCompleted extends StatefulWidget {
  final bool isTask;

  TaskCompleted({Key key, @required this.isTask}) : super(key: key);

  @override
  _TaskCompletedState createState() => _TaskCompletedState();
}

class _TaskCompletedState extends State<TaskCompleted> {

  void initState() {
    super.initState();

  }

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
        child: Center(

            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TrophyAndRewards(),
            WhiteScreen( height: height * 0.6, children: [
              Container(
                height: height * 0.2,
                width: width * 0.6,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05, right: width * 0.05, top: height*0.2),
                      child: widget.isTask
                          ? Image.asset("assets/taskdone.png", height:height*0.5,)
                          : Image.asset("assets/awardGuy.png")),
                ),
              ),
              Container(
                height: height * 0.02,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.isTask ? "Task Completed" : "Level Completed",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      color: Color(0xff489fb5),
                      fontSize: height * 0.04,
                    ),
                  ),
                  Text(
                    "YAY!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                        color: Color(0xff489fb5),
                        fontSize: height * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ]),
            StandardButton( text: "Continue", onTap: () {
              if (currentProgress.taskUnlocked==6 ){
                currentQuizProgress.reset();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CatchTheNut(start:false),
                      settings: RouteSettings(name: 'Tasks')),
                      (Route<dynamic> route) => false,
                );
              }
              else if(widget.isTask && currentProgress.playingLevel2)
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TasksLevel2(),
                      settings: RouteSettings(name: 'Tasks Level 2')),
                  (Route<dynamic> route) => false,
                );
              else if(widget.isTask)
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Tasks(),
                      settings: RouteSettings(name: 'Tasks')),
                      (Route<dynamic> route) => false,
                );
              else
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Levels(),
                      settings: RouteSettings(name: 'Levels')),
                  (Route<dynamic> route) => false,
                );
            })
          ],
        )),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

