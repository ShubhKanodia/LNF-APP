import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './assets.dart';
class PersonList extends StatefulWidget {
  @override
  _PersonListState createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Scaffold(
      body:Center(
        child:Column(
          children: [
            Row(
              children: [
                Padding(
                padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                  child:Container(
                    height: height*0.1,
                    width:width*0.15,
                    alignment: Alignment.topLeft,
                    child: Assets.backButton,
                  )
                )
              ],
            ),
            Container(
              //width: width*1.5,
              padding: const EdgeInsets.fromLTRB(20,0,0,0),
              child: Text("Select a Gift Receiver",
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      inherit: true,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFA62B),
                      shadows: [
                        Shadow( // bottomLeft
                            offset: Offset(-0.5, -0.5),
                            color: Colors.black
                        ),
                        Shadow( // bottomRight
                            offset: Offset(0.5, -0.5),
                            color: Colors.black
                        ),
                        Shadow( // topRight
                            offset: Offset(1, 1),
                            color: Colors.black
                        ),
                        Shadow( // topLeft
                            offset: Offset(-1, 1),
                            color: Colors.black
                        ),
                      ]
                  ),
                ),
              ),
            ),
            Container(
              //height: height*0.2,
              // width: width*1.5,
              padding: const EdgeInsets.fromLTRB(20,0,0,0),
              child:Text(
                "Click on the person card to know more",
                    style:GoogleFonts.quicksand(
                      color: Color(0xff16697A),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )
              )
            ),
            Expanded(child: ListView(
              children: [
                Container(
                  height: height*0.20,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x33000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: height*0.20,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x33000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: height*0.20,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x33000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: height*0.20,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x33000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Colors.white,
                  ),
                ),
              ],
            ))
          ],
        ),
      )
    );
  }
}
