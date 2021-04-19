import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget button(
    {@required String text,
    @required double height,
    @required double width,
    @required Function onTap}) {
  return Container(
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
                fontSize: height * 0.5),
            textAlign: TextAlign.left),
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all<Color>(Color(0xffcb7703)),
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return 0;
              return 8; // Use the component's default.
            },
          ),
          minimumSize: MaterialStateProperty.all<Size>(Size(width, height)),
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

Widget whiteScreen(context,
    {@required double height, @required List<Widget> children}) {
  return Center(
    child: Container(
        width: MediaQuery.of(context).size.width * 0.80,
        height: height,
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
            children: children)),
  );
}
