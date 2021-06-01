import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';



///Gives the standard button used all throughout the application. USE THIS ONLY
///need to pass a variable called context and a text in double quotes in the form text:"<Button Content>"
///Also need to pass what should happen on click of the button to onTap in the form onTap:(){<code goes here>}
Widget button(context, {@required String text, @required Function onTap}) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return Container(
    height: height * 0.065,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xffca7602),
            blurRadius: 0.0, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              2.0, // Move to bottom 10 Vertically
            ),
          )
        ],
        color: Color(0xffffa62b),
        border: Border.all(
          color: Color(0xffffa62b),
        ),
        borderRadius: BorderRadius.all(Radius.circular(20))),
    child: ElevatedButton(
        child: Text(text,
            style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: height * 0.03),
            textAlign: TextAlign.left),
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all<Color>(Color(0xffcb7703)),
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return 0;
              return 8; // Use the component's default.
            },
          ),
          minimumSize:
              MaterialStateProperty.all<Size>(Size(width * 0.6, height * 0.65)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return Color(0xfaffa62b);
              return Color(0xffffa62b); // Use the component's default.
            },
          ),
        ),
        onPressed: onTap),
  );
}

///Gives a white screen with some slight elevation as is used across the entire application.
///You need to pass a variable called context(don't worry aboout it)
///You need to pass a List of widgets (Similar to what you pass into column) [Widget1,Widget2]
///You can also pass a padding variable if you feel you want some padding on all sides

Widget whiteScreen(context,
    {@required double height,
      double width,
    double padding = 0,
      double elevation = 4,
    @required List<Widget> children}) {
  return Container(
      width: width==null?MediaQuery.of(context).size.width * 0.80:width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height * 0.1),
        boxShadow: [
          BoxShadow(
            color: Color(0x338b8b8b),
            blurRadius: elevation,
            offset: Offset(0, elevation),
          ),
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children),
      ));
}

///Use this for the default back button. Using this as the first element of your column will make it standard everywhere
Widget backButton(context, {onTap}) {
  return Container(
    alignment: Alignment.topLeft,
    child: IconButton(
        iconSize: 50,
        icon: Icon(Icons.chevron_left),
        onPressed: onTap==null?() => Navigator.pop(context):onTap),
  );
}

Widget squareBlueButton(context,
    {@required String insideImageUrl, @required Function onTap}) {
  var width = MediaQuery.of(context).size.width;
  return Container(
    height:width * 0.15,
    width:width * 0.15,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff489fb5),
            blurRadius: 1.0, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              2.0, // Move to bottom 10 Vertically
            ),
          )
        ],
        color: Color(0xff489fb5),
        borderRadius: BorderRadius.all(Radius.circular(20))),
    child: ElevatedButton(
        child: Container(
            width: width * 0.1, child: SvgPicture.asset(insideImageUrl)),
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all<Color>(Color(0xff489fb5)),
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return 0;
              return 8; // Use the component's default.
            },
          ),
          minimumSize:
              MaterialStateProperty.all<Size>(Size(width * 0.15, width * 0.15)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return Color(0xfa489fb5);
              return Color(0xff489fb5); // Use the component's default.
            },
          ),
        ),
        onPressed: onTap),
  );
}

Widget circularOrangeButton(context,
    {@required String text,
    @required bool enabled,
    @required bool number,
    bool light = false,
    @required Function onTap}) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  ConfettiController confettiController = ConfettiController(duration : Duration(seconds:1));
  if(light) confettiController.play();
  return ConfettiWidget(
    confettiController: confettiController,
    blastDirectionality: BlastDirectionality
        .explosive, // don't specify a direction, blast randomly
    shouldLoop:
    false, // start again as soon as the animation is finished
    colors: const [
      Colors.green,
      Colors.blue,
      Colors.pink,
      Colors.orange,
      Colors.purple
    ],
    child:  Container(
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: light ? Color(0xfffad207) : Color(0x66cb7703),
            blurRadius: 1.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              2.0, // Move to bottom 10 Vertically
            ),
          )
        ],
        color: light ? Color(0xfffaf063) : Color(0xfffbc67e),
        borderRadius: BorderRadius.all(Radius.circular(100))),
    child: ElevatedButton(
        child: Text(
          text.toString(),
          style: GoogleFonts.quicksand(
              color: light ? Color(0xff16697a) : Color(0xffffffff),
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: number ? height * 0.04 : height * 0.02),
        ),
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all<Color>(
              light ? Color(0xfffad207) : Color(0x66cb7703)),
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return 0;
              return 8; // Use the component's default.
            },
          ),
          minimumSize:
              MaterialStateProperty.all<Size>(Size(width * 0.15, width * 0.15)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          )),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return enabled ? Color(0xfafbc67e) : Color(0xfffbc67e);
              return enabled
                  ? light
                      ? Color(0xfafaf063)
                      : Color(0xffffa62b)
                  : Color(0xfffbc67e); // Use the component's default.
            },
          ),
        ),
        onPressed: enabled?onTap:null),
  ));
}
