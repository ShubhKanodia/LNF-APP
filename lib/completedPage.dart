import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/widgets.dart';

class TaskCompleted extends StatefulWidget {
  bool task;
  int trophies;
  int rewards;
  TaskCompleted(
      {Key key,
      @required this.task,
      @required this.trophies,
      @required this.rewards})
      : super(key: key);

  @override
  _TaskCompletedState createState() => _TaskCompletedState();
}

class _TaskCompletedState extends State<TaskCompleted> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.1,
                      top: height * 0.02,
                      right: width * 0.1,
                      bottom: height * 0.03),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: width * 0.3,
                        height: height * 0.075,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(250),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x1e000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(widget.trophies.toString(),
                              style: GoogleFonts.quicksand(
                                color: Color(0xff16697a),
                                fontSize: height * 0.045,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.end),
                        ),
                      ),
                      Container(
                          height: height * 0.075,
                          width: width * 0.15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff0e4f5c),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: Color(0xff489fb5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.03, right: width * 0.03),
                            child: Image.asset("assets/trophy.png"),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.1,
                      top: height * 0.02,
                      right: width * 0.1,
                      bottom: height * 0.03),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: width * 0.3,
                        height: height * 0.075,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(250),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x1e000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(widget.rewards.toString(),
                              style: GoogleFonts.quicksand(
                                color: Color(0xff16697a),
                                fontSize: height * 0.045,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.end),
                        ),
                      ),
                      Container(
                          height: height * 0.075,
                          width: width * 0.15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff0e4f5c),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: Color(0xff489fb5),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.03, right: width * 0.03),
                              child: SvgPicture.asset("assets/medal.svg"))),
                    ],
                  ),
                ),
              ],
            ),
            whiteScreen(context, height: height * 0.5, children: [
              Container(
                height: height * 0.2,
                width: width * 0.6,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05, right: width * 0.05),
                      child: widget.task
                          ? SvgPicture.asset("assets/bigMedal.svg")
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
                    widget.task ? "Task Completed" : "Level Completed",
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
            GestureDetector(
              onTap: () {},
              child: Container(
                height: height * 0.08,
                width: width * 0.65,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffca7602),
                        blurRadius: 0.0, // soften the shadow
                        spreadRadius: 2.0, //extend the shadow
                        offset: Offset(
                          0.0, // Move to right 10  horizontally
                          4.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                    color: Color(0xffffa62b),
                    border: Border.all(
                      color: Color(0xffffa62b),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Center(
                  child: Text(
                    "Continue",
                    style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.04),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
