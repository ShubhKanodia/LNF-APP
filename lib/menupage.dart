import 'package:flutter/material.dart';
import 'package:learnnfun/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
              backButton(context),
              Text('Options',
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xff489fb5),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:height*0.08),
                child: button(context, text: 'Profile', onTap: null),
              ),
              Padding(
                padding: EdgeInsets.only(top:height*0.07),
                child: button(context, text: 'Setting', onTap: null),
              ),
              Padding(
                padding: EdgeInsets.only(top:height*0.07),
                child: button(context, text: 'Sound', onTap: null),
              ),
              Padding(
                padding: EdgeInsets.only(top:height*0.07),
                child: button(context, text: 'Help', onTap: null),
              ),
              Padding(
                padding: EdgeInsets.only(top:height*0.07),
                child: button(context, text: 'About Us', onTap: null),
              )
            ],
          ),

        ),
      ),
    );
  }
}
