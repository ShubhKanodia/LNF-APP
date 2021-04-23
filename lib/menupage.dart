import 'package:flutter/material.dart';
import 'package:learnnfun/login.dart';
import 'package:learnnfun/registerInfo.dart';
import 'package:learnnfun/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth.dart';

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
                child: button(context, text: 'Profile', onTap: (){
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => RegistrationInfo(),
    settings: RouteSettings(name: 'Actual game')));}),
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
                child: button(context, text: 'Log Out', onTap: (){
                  Auth().signOut();
  Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
  builder: (context) => Login(),
  settings: RouteSettings(
  name: 'Login')),
  (Route<dynamic> route) => false,
  );
  })
              )
            ],
          ),

        ),
      ),
    );
  }
}
