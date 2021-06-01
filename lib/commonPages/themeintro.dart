import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/overallPages/levels.dart';
import 'package:learnnfun/widgets.dart';

class ThemeIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.02, right: width * 0.02, top: height * 0.01),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(bottom: height * 0.05),
                  child:
                  Text(
                    "Gift a Friend",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                        color: Color(0xff489fb5),
                        fontSize: height * 0.045,
                        fontWeight: FontWeight.bold),
                  ),
                  ),
                  Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                height: height * 0.3,
                width: width * 0.6,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05),
                    child: SvgPicture.asset("assets/gift.svg"),
                  ),
                ),
              ),
            ),
                  Padding(padding: EdgeInsets.only(left: width * 0.13, right: width * 0.13 , top: height * 0.1, bottom: height * 0.02),
                  child: Text(
                    "Use Design Thinking to design a custom gift for a friend!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                        color: Color(0xff489fb5),
                        fontSize: height * 0.025,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  )
                  ,
                  Padding(padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08 , top: height * 0.01, bottom: height * 0.05),
                  child: Text(
                    "Through this experience, you will learn how to better understand and fulfill unmet needs of people you’re creating for in the real world.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      color: Color(0xff489fb5),
                      fontSize: height * 0.025,
                    ),
                  ),
                  ),
                ],
              ),
            ),
            StandardButton( text: "Continue", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Tasks(),
                    settings: RouteSettings(name: 'Actual game')),
              );
            })
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
