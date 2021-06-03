
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/widgets.dart';
import '../Persona.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key key}) : super(key: key);

  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {

  List<String> Names=["Jessica Pearson","Harvey","Rachel Zone","Mike Ross","Jake peralta","RoyHolt"];
  List<String> Trophies=['7','6','7','4','2','1'];
  List<String> Badges=['2','2','1','-','-','-'];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StdBackButton(),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.2,
                        top: height * 0.03,
                        //right: width * 0.1,
                        bottom: height * 0.03),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: width * 0.23,
                          height: height * 0.055,
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
                            padding: const EdgeInsets.all(5),
                            child: Text(currentProgress.trophies.toString(),
                                style: GoogleFonts.quicksand(
                                  color: Color(0xff16697a),
                                  fontSize: height * 0.03,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.end),
                          ),
                        ),
                        Container(
                            height: height * 0.06,
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
                        //left: width * 0.1,
                        top: height * 0.03,
                        //right: width * 0.1,
                        bottom: height * 0.03),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: width * 0.23,
                          height: height * 0.055,
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
                            padding: const EdgeInsets.all(5),
                            child: Text(currentProgress.rewards.toString(),
                                style: GoogleFonts.quicksand(
                                  color: Color(0xff16697a),
                                  fontSize: height * 0.03,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.end),
                          ),
                        ),
                        Container(
                            height: height * 0.06,
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
              Padding(
                padding:EdgeInsets.only(bottom: height*0.05,),
                child: Text("Leader Board",
                style:GoogleFonts.quicksand(
                  color: Color(0xffffa62b),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: height*0.05,
                ) ,),
              ),
              WhiteScreen(height: height*0.68,
                children: [
                Stack(
                  children: [
                    Positioned(
                    top:-height*0.13,
                    right:width*0.2,
                      child: Container(
                          height: height * 0.06,
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
                            child: Image.asset("assets/trophy.png",),
                          )),
                    ),
                    Positioned(
                      top:-height*0.13,
                      right:width*0.05,
                      child: Container(
                          height: height * 0.06,
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
                              child: SvgPicture.asset("assets/medal.svg"))
                      ),
                    ),
                    ListView.builder(
                      itemCount: Names.length,
                      itemBuilder: (BuildContext  context, int index){
                        return Padding(
                          padding:EdgeInsets.only(bottom: height*0.03),
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                    height: height * 0.045,
                                    width: width * 0.12,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xffcb7703),
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                      color: Color(0xffffa62b),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 0.03, right: width * 0.03),
                                        child: Text("$index",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: height*0.025,
                                          color: Colors.white,
                                        )
                                          ,),)
                                ),
                                Container(
                                  width:width*0.4,
                                  child: Text("${Names[index]}",
                                  style: GoogleFonts.quicksand(
                                    color: Color(0xff489fb5),
                                    fontWeight: FontWeight.w700,
                                    fontStyle:  FontStyle.normal,
                                    fontSize: height*0.02,
                                  ),),
                                ),
                                SizedBox(width: width*0.01,),
                                Text("${Trophies[index]}",
                                  style: GoogleFonts.quicksand(
                                    color: Color(0xff489fb5),
                                    fontWeight: FontWeight.w700,
                                    fontStyle:  FontStyle.normal,
                                    fontSize: height*0.02,
                                  ),),
                                SizedBox(width: width*0.12),
                                Text("${Badges[index]}",
                                  style: GoogleFonts.quicksand(
                                    color: Color(0xff489fb5),
                                    fontWeight: FontWeight.w700,
                                    fontStyle:  FontStyle.normal,
                                    fontSize: height*0.02,
                                  ),)
                              ],
                            )
                          ),
                        );
                      },
                      shrinkWrap: true,
                    )
                  ],
                  overflow: Overflow.visible,
                )
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
