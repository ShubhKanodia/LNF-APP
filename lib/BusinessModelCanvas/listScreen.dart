import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learnnfun/DesignThinking/assets.dart';
import 'package:learnnfun/DesignThinking/widgets.dart';
import 'package:learnnfun/auth.dart';

import 'data.dart';

class ListScreen extends StatefulWidget {

  ListScreen({Key key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Map<String, Color> horizontalCircles;
  String itemSelected;
  List bmcSelected;



  void initState() {
      horizontalCircles = Map.fromIterables(
          farmScores.keys,
          List.generate(
              farmScores.length, (index) => Colors.white.withOpacity(0.2)));
    itemSelected = horizontalCircles.keys.elementAt(0);
    //List bmcSelected = List.filled(farmScores[itemSelected].length,false);
    horizontalCircles.update(
        itemSelected, (value) => Colors.white);
    super.initState();
  }

  changeSelected(selected ,bmcElement, index) async {
    setState(() {
      bmcElement.selected = selected;
    });
    var farmScores = await userDocReference.collection("BMCFarmScores").doc(
        itemSelected).get();
    if (farmScores.exists) {
      userDocReference.collection("BMCFarmScores").doc(itemSelected).update(
          {index.toString(): selected});
    }
    else{
      userDocReference.collection("BMCFarmScores").doc(itemSelected).set(
          {index.toString(): selected});
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffbdcb43),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                StdBackButton(),
                    Align(
                      alignment: Alignment.center,
                        child: SvgPicture.asset("assets/BMC/BMC.svg")),
              ],
            ),
            new Text("Farm Business",
                style: TextStyle(
                  fontFamily: 'MohaveMedium',
                  color: Color(0xfff8ff20),
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    WhiteScreen(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      width: width * 0.9,
                      elevation: 2,
                      padding: 10,
                      children: List.generate(farmScores[itemSelected].length, (index) {
                          //print(farmScores[itemSelected]);
                        return BMCRow(option: farmScores[itemSelected][index],
                    changeSelected:(b)=>changeSelected(b,farmScores[itemSelected][index],index));
                }),
                    ),
                  Container(
                    height:height*0.2,
                    child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: horizontalCircles.length,
                    itemBuilder: (BuildContext context, int index) {
                      ///Will be name
                      var item = horizontalCircles.keys.elementAt(index);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,

                            children: [

                          Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    horizontalCircles.updateAll((key, value) =>
                                        Colors.white.withOpacity(0.2));
                                    setState(() {
                                      itemSelected = item;
                                      horizontalCircles.update(
                                          item, (value) => Colors.white);
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: height * 0.02,
                                        horizontal: width * 0.03),
                                    height: height * 0.08,
                                    width: height * 0.08,
                                    padding: EdgeInsets.all(height * 0.2),
                                    decoration: BoxDecoration(
                                      color: horizontalCircles[item],
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Text(item,
                                    style: TextStyle(
                                      fontFamily: 'MohaveMedium',
                                      color: Colors.white,
                                      fontSize: height * 0.02,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    ))
                              ],
                            ),
                          )
                        ]),
                      );
                    },
                ),
                  ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*class ItemRow extends StatelessWidget {
  final String item;
  final int quantity;
  final int sellingPrice;
  final String image;

  ItemRow({
    Key key,
    @required this.item,
    @required this.quantity,
    @required this.sellingPrice,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            Text("Available: $quantity",
                style: TextStyle(
                  fontFamily: 'MohaveRegular',
                  color: Color(0xffb36642),
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            Text("Selling Price :$sellingPrice",
                style: TextStyle(
                  fontFamily: 'MohaveRegular',
                  color: Color(0xffb36642),
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            Row(
              children: [
                ElevatedButton(
                    child: Text(
                      "Units  100",
                      style: TextStyle(
                          fontSize: height * 0.02, color: Colors.green),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xfff2f5d8)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                    onPressed: () => null),
                ElevatedButton(
                    child: Text(
                      "2500",
                      style: TextStyle(
                          fontSize: height * 0.02, color: Colors.white),
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
        )
      ],
    );
  }
}*/

class BMCRow extends StatelessWidget {
  BMCElement option;
  Function changeSelected;

  BMCRow({
    Key key,
    @required this.option,
    @ required this.changeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width*0.3,
          child: Text("${option.name}",
              style: TextStyle(
                fontFamily: 'MohaveMedium',
                color: Color(0xff945437),
                fontSize: height * 0.025,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ), overflow: TextOverflow.fade ,),
        ),
        Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateColor.resolveWith(
                (states) => Colors.green),
            value: option.selected,
            onChanged: changeSelected
            ),
      ],
    );
  }
}
