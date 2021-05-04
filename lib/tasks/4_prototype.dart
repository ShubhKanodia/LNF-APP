import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/commonPages/informationCard.dart';
import 'package:learnnfun/commonPages/taskIntro.dart';
import 'package:learnnfun/overallPages/levels.dart';
import 'package:learnnfun/widgets.dart';

class Prototype extends StatefulWidget {
  const Prototype({Key key}) : super(key: key);

  @override
  _PrototypeState createState() => _PrototypeState();
}

class _PrototypeState extends State<Prototype> {
  int step = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        body: Center(
            child: Column(
                children: [
          backButton(context),
          Text("Prototype",
              style: GoogleFonts.quicksand(
                  color: const Color(0xff489fb5),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: height * 0.05)),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.2,
                right: width * 0.2,
                top: height * 0.001,
                bottom: height * 0.001),
            child: Text("Select items from the inventory to assemble the gift!",
                style: GoogleFonts.quicksand(
                    color: const Color(0xff1a1b41),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: height * 0.02)),
          ),
                  Container(height:height*0.05),
          whiteScreen(context, height: height * 0.3, children: []),
          Container(height:height*0.05),
          Expanded(
            child: Container(
              
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height * 0.05),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x338b8b8b),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(children: [
                          Visibility(
                            maintainState: true,
                            maintainAnimation: true,
                            maintainSize: true,
                              visible: step != 0,
                              child: IconButton(
                                  iconSize: 50,
                                  icon: Icon(Icons.chevron_left),
                                  onPressed: () {
                                    setState(() {
                                      step--;
                                    });
                                  })),
                          Container(
                            width:width*0.5,
                            child: Text(step==0?"Select Category":step==1?"Select Sport":step==2?"Select Item":"Select Colour",
                                style: GoogleFonts.quicksand(
                                    color: const Color(0xff489fb5),
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: height * 0.03),
                                textAlign: TextAlign.center),
                          ),
                          step != 3
                              ? IconButton(
                                  iconSize: 50,
                                  icon: Icon(Icons.chevron_right),
                                  onPressed: () {
                                    setState(() {
                                      step++;
                                    });
                                  })
                              : IconButton(
                                  iconSize: 50,
                                  icon: Icon(Icons.check),
                                  onPressed: () =>
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => InformationCard(cardNumber: 2, onTap:(){
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => TaskIntro(taskNumber: 3),
                                                        settings: RouteSettings(name: 'Task 2')));
                                              }),
                                              settings: RouteSettings(name: 'Actual game')))
                                      ),
                        ])
                      ]),
                )),
          )
        ])));
  }
}
