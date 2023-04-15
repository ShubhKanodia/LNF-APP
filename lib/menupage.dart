import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/gameSelection.dart';
import 'package:learnnfun/login.dart';
import 'package:learnnfun/registerInfo.dart';
import 'package:learnnfun/DesignThinking/widgets.dart';

import 'package:learnnfun/auth.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StdBackButton(),
              Text(
                "Options",
                style: GoogleFonts.signika(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),

              // Text(
              //   'Options',
              //   style: GoogleFonts.quicksand(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 25,
              //     color: Color(0xA020F0),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.08),
                child: ElevatedButton(
                    child: Text(
                      'Profile',
                      style: GoogleFonts.signika(fontSize: 25),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(87, 12, 87, 12),
                        backgroundColor: Color(0xFF9c27b0),
                        shadowColor: Color(0xff9400d3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationInfo(),
                              settings: RouteSettings(name: 'Actual game')));
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.07),
                child: ElevatedButton(
                    child: Text(
                      'Setting',
                      style: GoogleFonts.signika(fontSize: 25),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(85, 12, 85, 12),
                        backgroundColor: Color(0xFF9c27b0),
                        shadowColor: Color(0xff9400d3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {}),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.07),
                child: ElevatedButton(
                    child: Text(
                      'Change Game',
                      style: GoogleFonts.signika(fontSize: 25),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(49, 12, 49, 12),
                        backgroundColor: Color(0xFF9c27b0),
                        shadowColor: Color(0xff9400d3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GameSelection(),
                              settings: RouteSettings(name: 'Choosing Game')));
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.07),
                child: ElevatedButton(
                    child: Text(
                      'Help',
                      style: GoogleFonts.signika(fontSize: 25),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(97, 12, 97, 12),
                        backgroundColor: Color(0xFF9c27b0),
                        shadowColor: Color(0xff9400d3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {}),
              ),
              Padding(
                  padding: EdgeInsets.only(top: height * 0.07),
                  child: ElevatedButton(
                      child: Text(
                        'Log Out',
                        style: GoogleFonts.signika(fontSize: 25),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(80, 12, 80, 12),
                          backgroundColor: Color(0xFF9c27b0),
                          shadowColor: Color(0xff9400d3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        Auth().signOut();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login(),
                              settings: RouteSettings(name: 'Login')),
                          (Route<dynamic> route) => false,
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
