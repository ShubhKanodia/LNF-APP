import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'assets.dart';

class TaskCompleted extends StatefulWidget {
  TaskCompleted({Key key}) : super(key: key);
  @override
  _TaskCompletedState createState() => _TaskCompletedState();
}

class _TaskCompletedState extends State<TaskCompleted> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children:[
                  Container(height: height*0.2,
                    width: width*0.1,
                  ),
                Container(
                  width:width*0.25,
                  height: height*0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height*0.1),
                    color: Colors.white,
                  ),
                  child: Container(
                    height:height*0.055,
                    width: width*0.055,
                    //alignment: ,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Padding(
                        padding: EdgeInsets.only(right:width*0.3),
                        child: Assets.trophy,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: width*0.1),
                    width:width*0.25,
                    height: height*0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(height*0.1),
                      color: Colors.white,
                    ),
                    child: Container(
                      height:height*0.055,
                      width: width*0.055,
                      //alignment: ,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Padding(
                          padding: EdgeInsets.only(right:width*0.3),
                          child: Assets.trophy,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: width*0.8 ,
                height: height * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height*0.1),
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
                    Container(height: height*0.02,),
                    Container(
                      height:height*0.2,
                      width: width*0.6,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Padding(
                          padding: EdgeInsets.only(left:width*0.05, right:width*0.05),
                          child: Assets.Reward,
                        ),
                      ),
                    ),
                    Container(height: height*0.02,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Task Completed",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                            color: Color(0xff489fb5),
                            fontSize: height*0.045,
                          ),
                        ),
                        Text(
                          "YAY!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                              color: Color(0xff489fb5),
                              fontSize: height*0.045,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                    margin: EdgeInsets.only(top: height*0.05),
                    height: height*0.08,
                    width: width*0.65,
                    decoration: BoxDecoration(
                        boxShadow: [

                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              3.0, // Move to right 10  horizontally
                              5.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        color: Color(0xffffa62b),
                        border: Border.all(color: Color(0xffffa62b),

                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Continue",style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: height*0.04
                        ),),
                      ],
                    )
                ),
              ),

            ],
          )),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
