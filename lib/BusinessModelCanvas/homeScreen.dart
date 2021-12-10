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
  List<int> l = List.filled(15,0);
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
        Expanded(
          child: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 3,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(15, (index) {
              return FarmLand(level:0,vegetableCode: l[index], index: index, vegetables: l);
            }),
          ),
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
class FarmLand extends StatefulWidget {

  final int vegetableCode;
  ///4 Levels (0-3)
  final int level;
  final int index;
  final List<int> vegetables;
  const FarmLand({@required this.vegetableCode,  @required this.level, @required this.index,@required this.vegetables ,Key key}) : super(key: key);
  //FarmLand({@required vegetableCode,  @required level, @required index}) : assert(vegetableCode >=0 && vegetableCode<4 && level>=0 && level<4),super(key: key);
  @override
  _FarmLandState createState() => _FarmLandState();
}
class _FarmLandState extends State<FarmLand> {
  ///Vegetable Code
  ///0 - Undecided
  ///1 - Pumpkin
  ///2 - Wheat
  ///3 - Corn

  int vegetableCode;
  ///4 Levels (0-3)
  int level;
  int index;
  List<int> vegetables;
  List<String> strings = ["assets/BMC/F1.svg","assets/BMC/F2.svg","assets/BMC/F2.svg","assets/BMC/F2.svg"];

  Future<void> buyPopup(BuildContext context, List<int> l,int index ) async {
    print(l);
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
                      vegetables: l,
                      index: index,
                      item: "Pumpkin",
                      buyingPrice: 20,
                      image: "assets/BMC/Pumpkin2.svg",),
                    buyItem(
                      vegetables: l,
                      index: index,
                      item: "Wheat",
                      buyingPrice: 20,
                      image: "assets/BMC/Wheat2.svg",),
                    buyItem(
                      vegetables: l,
                      index: index,
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


@override
  void initState() {

  vegetableCode = widget.vegetableCode;
  ///4 Levels (0-3)
  level = widget.level;
  index = widget.index;
  vegetables = widget.vegetables;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
          //print(vegetables);
        await buyPopup(context,vegetables,index);
        setState(() {
          vegetableCode = vegetables[index];
          //vegetables[index] = vegetableCode;
          //TODO save state
        });
      },
      child: Container(
          padding: EdgeInsets.all(3),
          child: SvgPicture.asset(strings[vegetableCode??0])),
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
  final List<int> vegetables;
  final int index;

  buyItem({
    Key key,
    @required this.item,
    @required this.vegetables,
    @required this.index,
    @required this.buyingPrice,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    var height = MediaQuery.of(context).size.height;
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
                onPressed: (){
                  int vegetable = item=="Pumpkin"?1:(item=="Wheat"?2:3);
                  /// save in db vegetable
                 // print(vegetables);
                  vegetables[index] = vegetable;
                  //print(vegetables);
                  Navigator.pop(context);
                }),
          ],
        )
      ],
    );
  }
}