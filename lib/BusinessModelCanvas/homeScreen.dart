import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'listScreen.dart';

class Farm extends StatefulWidget {
  const Farm({Key key}) : super(key: key);

  @override
  _FarmState createState() => _FarmState();
}

class _FarmState extends State<Farm> {

  int coins=0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xffbdcb43),
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top:height*0.02,left:width*0.05),
              child: Column(
                children: [
                  Row(children:[
                    Text("Level",
                      style: TextStyle(
                          fontFamily: 'MohaveMedium',
                          color: Color(0xff73402a),
                          fontSize: height*0.025,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                      )),
                    Container(
                      padding: EdgeInsets.only(left:width*0.02),
                      width: width*0.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Container(

                          padding: EdgeInsets.all(3) ,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white ,
                          ),
                          child: LinearProgressIndicator(
                            color: Colors.white70,
                            backgroundColor:  Colors.white,
                            minHeight: height*0.007,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                            value: 0.5,
                          ),
                        ),
                      ),
                    ),


                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Text("Total",
                        style: TextStyle(
                          fontFamily: 'MohaveMedium',
                          color: Color(0xff73402a),
                          fontSize: height*0.025,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                        Coin(),
                      new Text("250,200",
                          style: TextStyle(
                            fontFamily: 'MohaveBold',
                            color: Color(0xfff8ff20),
                            fontSize: height*0.04,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,


                          )
                      )
                  ],)
                ],
              ),
            ),
            Row(
              children: [
                FarmLand(level:0,vegetableCode: 0,),
                FarmLand(level:0,vegetableCode: 0,),
                FarmLand(level:0,vegetableCode: 0,),
              ],
            ),
            Row(
              children: [
                FarmLand(level:0,vegetableCode: 0,),
                FarmLand(level:0,vegetableCode: 0,),
                FarmLand(level:0,vegetableCode: 0,),
              ],
            ),
            Row(
              children: [
                FarmLand(level:0,vegetableCode: 0,),
                FarmLand(level:0,vegetableCode: 0,),
                FarmLand(level:0,vegetableCode: 0,),
              ],
            ),
            Row(
              children: [
                FarmLand(level:0,vegetableCode: 0,),
                FarmLand(level:0,vegetableCode: 0,),
                FarmLand(level:0,vegetableCode: 0,),
              ],
            ),
            Row(
              children: [
                FarmLand(level:0,vegetableCode: 0,),
                FarmLand(level:0,vegetableCode: 0,),
                FarmLand(level:0,vegetableCode: 0,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ListScreen(silo:false),
                            settings: RouteSettings(name: 'Actual game')));
                  },
                  child: SvgPicture.asset("assets/BMC/BMC.svg"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ListScreen(silo:true),
                            settings: RouteSettings(name: 'Actual game')));
                  },
                  child: SvgPicture.asset("assets/BMC/Silo.svg"),
                )
              ],
            )

          ],
        )));
  }
}

class FarmLand extends StatelessWidget {
  ///Vegetable Code
  ///0 - Undecided
  ///1 - Pumpkin
  ///2 - Wheat
  ///3 - Corn
  int vegetableCode;

  ///4 Levels (0-3)
  int level;


  Future<void> buyPopup(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height*0.5,
              width: MediaQuery.of(context).size.width*0.8,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buyItem(
                      item: "Pumpkin",
                      buyingPrice: 20,
                      image: "assets/BMC/Pumpkin2.svg",),
                    buyItem(
                      item: "Wheat",
                      buyingPrice: 20,
                      image: "assets/BMC/Wheat2.svg",),
                    buyItem(
                      item: "Corn",
                      buyingPrice: 20,
                      image: "assets/BMC/Corn2.svg",),
                  ],
                ),
              )
            ),
          );
        });
  }

  FarmLand({Key key, @required vegetableCode,  @required level}) : assert(vegetableCode >=0 && vegetableCode<4 && level>=0 && level<4),super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await buyPopup(context);
      },
      child: Container(
          padding: EdgeInsets.all(3),
          child: SvgPicture.asset("assets/BMC/F1.svg")),
    );
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

class buyItem extends StatelessWidget{
  final String item;
  final int buyingPrice;
  final String image;

  buyItem({
    Key key,
    @required this.item,
    @required this.buyingPrice,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SvgPicture.asset("$image"),
        Column(
          children: [
            Text("$item",
                style: TextStyle(
                  fontFamily: 'MohaveMedium',
                  color: Color(0xff945437),
                  fontSize: height * 0.025,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            Text("Buying Price: $buyingPrice",
                style: TextStyle(
                  fontFamily: 'MohaveRegular',
                  color: Color(0xffb36642),
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            ElevatedButton(
                child: Text(
                  "Buy",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02, color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green),
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                onPressed: () => null),
          ],
        )
      ],
    );
  }
}