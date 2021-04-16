import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/assets.dart';

class TaskCompleted extends StatefulWidget {
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
      body: Center(

          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                /// TODO: Deal with alignment issues
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0, // soften the shadow
                            spreadRadius: 1.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 10  horizontally
                              1.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(width: width * 0.2),
                        Text(
                          "8",
                          style: GoogleFonts.quicksand(
                              color: Color(0xff16697a),
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.035),
                        ),
                        Container(width: width * 0.05),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.07,
                    width: width * 0.2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // You can use like this way or like the below line
                      //borderRadius: new BorderRadius.circular(30.0),
                      color: Color(0xff489fb5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.01, right: width * 0.01),
                      child: Assets.tinyTrophy,

                      /// issues with the image
                    ),
                  ),
                ],
              ),
              Container(
                /// TODO: change the width of this container after the rounded boxes are added
                height: height * 0.1,
                width: width * 0.25,
              ),
              Stack(
                /// TODO: Deal with alignment issues
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0, // soften the shadow
                            spreadRadius: 1.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 10  horizontally
                              1.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(width: width * 0.2),
                        Text(
                          "14",
                          style: GoogleFonts.quicksand(
                              color: Color(0xff16697a),
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.035),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.07,
                    width: width * 0.2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // You can use like this way or like the below line
                      //borderRadius: new BorderRadius.circular(30.0),
                      color: Color(0xff489fb5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.01, right: width * 0.01),
                      child: Assets.tinyReward,

                      /// issues with the image
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: width * 0.80,
            height: height * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height * 0.1),
              boxShadow: [
                BoxShadow(
                  color: Color(0x338b8b8b),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * 0.01,
                ),
                Container(
                  height: height * 0.2,
                  width: width * 0.6,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05, right: width * 0.05),
                      child: Assets.reward,

                      /// issues with the image
                    ),
                  ),
                ),
                Container(
                  height: height * 0.02,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Task Completed",
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
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: height * 0.05),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Continue",
                    style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.04),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
