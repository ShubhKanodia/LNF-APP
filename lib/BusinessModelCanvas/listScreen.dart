import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learnnfun/DesignThinking/widgets.dart';

import 'data.dart';

class ListScreen extends StatefulWidget {
  bool silo;

  ListScreen({Key key, @required this.silo}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Map<String, Color> horizontalCircles;
  String itemSelected;

  void initState() {
    if (widget.silo) {
      horizontalCircles = Map.fromIterables(
          siloTextOptions,
          List.generate(siloTextOptions.length,
              (index) => Colors.white.withOpacity(0.2)));
    } else {
      horizontalCircles = Map.fromIterables(
          farmScores.keys,
          List.generate(
              farmScores.length, (index) => Colors.white.withOpacity(0.2)));
    }
    itemSelected = horizontalCircles.keys.elementAt(0);
    horizontalCircles.update(
        itemSelected, (value) => Colors.white);
    super.initState();
  }

  changeSelected(index){
    setState(() {
      
    });
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
            widget.silo
                ? SvgPicture.asset("assets/BMC/Silo.svg")
                : SvgPicture.asset("assets/BMC/BMC.svg"),
            new Text(
                widget.silo ? "Farm Resources and Products" : "Farm Business",
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
                      height: height * 0.5,
                      padding: 10,
                      children: widget.silo
                          ? [
                        ItemRow(
                          sellingPrice: 20,
                          item: "Pumpkin",
                          quantity: 3000,
                          image: "assets/BMC/Pumpkin2.svg",
                        ),
                        ItemRow(
                          sellingPrice: 20,
                          item: "Wheat",
                          quantity: 3000,
                          image: "assets/BMC/Wheat2.svg",
                        ),
                        ItemRow(
                          sellingPrice: 20,
                          item: "Corn",
                          quantity: 3000,
                          image: "assets/BMC/Corn2.svg",
                        )
                      ]
                          : List.generate(farmScores[itemSelected].length, (index) => BMCRow(option: farmScores[itemSelected].keys.elementAt(index), selected: true)),
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

class ItemRow extends StatelessWidget {
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
}

class BMCRow extends StatelessWidget {
  String option;
  bool selected;
  Function changeSelected;

  BMCRow({
    Key key,
    @required this.option,
    @required this.selected,
    this.changeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Row(
              children: [
                Text("$option",
                    style: TextStyle(
                      fontFamily: 'MohaveMedium',
                      color: Color(0xff945437),
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
                Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green),
                    value: selected,
                    onChanged: changeSelected),
              ],
            )
          ],
        )
      ],
    );
  }
}
