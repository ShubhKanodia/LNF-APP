import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learnnfun/DesignThinking/Persona.dart';
import 'package:learnnfun/DesignThinking/widgets.dart';
import 'package:overlay_support/overlay_support.dart';

import '../auth.dart';
import 'IntroCard.dart';
import 'data.dart';
import 'farmLand.dart';
import 'listScreen.dart';

class Farm extends StatefulWidget {
  List<FarmLandData> farmLandInfo;

  Farm({@required this.farmLandInfo, Key key}) : super(key: key);

  @override
  _FarmState createState() => _FarmState();
}

class _FarmState extends State<Farm> {

  setCoins(){
    setState(() {
      currentProgress.rewards = currentProgress.rewards;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(widget.farmLandInfo);
    return Scaffold(
        backgroundColor: Color(0xffbdcb43),
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.02),
              child: Column(
                children: [
                  Row(
                    children: [
                      StdBackButton(),
                      Padding(
                        padding: EdgeInsets.only(left:width*0.2),
                        child: Text("BMC Farm",
                          style: TextStyle(
                            fontFamily: 'MohaveMedium',
                            color: Color(0xff73402a),
                            fontSize: height * 0.035,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Coins",
                              style: TextStyle(
                                fontFamily: 'MohaveMedium',
                                color: Color(0xff73402a),
                                fontSize: height * 0.025,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                          Coin(),
                          Text("${currentProgress.rewards}",
                              style: TextStyle(
                                fontFamily: 'MohaveBold',
                                color: Color(0xfff8ff20),
                                fontSize: height * 0.035,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        ],
                      ),
                      IconButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BMCIntro(farmLandInfo: widget.farmLandInfo,),
                              settings: RouteSettings(name: 'Business Model Canvas')),
                        );
                      }, icon: Icon(Icons.info))
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 3,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(9, (index) {
                  return FarmLand(
                      farm: widget.farmLandInfo[index], index: index, callback: setCoins,);
                }),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left:width*0.1,right:width*0.1),
                  child: Text("Manage your farm by modifying your Business Model Canvas below",
                      style: TextStyle(
                        fontFamily: 'MohaveMedium',
                        color: Color(0xff73402a),
                        fontSize: height * 0.025,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,

                      ),
                      textAlign: TextAlign.center,

                  ), ),
                    Text("Each block corresponds to a block of BMC. Control your yield by changing your farm's BMC. Compete to earn more than your friends!",
                      style: TextStyle(
                        fontFamily: 'MohaveMedium',
                        color: Color(0xff73402a),
                        fontSize: height * 0.020,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,

                      ),
                      textAlign: TextAlign.center,

                    ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListScreen(),
                            settings: RouteSettings(name: 'Actual game')));
                  },
                  child: SvgPicture.asset("assets/BMC/BMC.svg"),
                ),
              ],
            )
          ],
        )));
  }
}

class Coin extends StatelessWidget {
  const Coin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        child: SvgPicture.asset("assets/BMC/Coin.svg"));
  }
}

