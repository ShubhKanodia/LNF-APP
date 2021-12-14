import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learnnfun/DesignThinking/Persona.dart';
import 'package:overlay_support/overlay_support.dart';

import '../auth.dart';
import 'data.dart';

class FarmLand extends StatefulWidget {
  FarmLandData farm;
  final int index;
  final Function callback;

  FarmLand({this.farm, @required this.index, this.callback, Key key}) : super(key: key);

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

  Duration timediff;
  Timer _everySecond;
  var inProgress = false;
  int vegetableCode;
  DateTime deadline;

  Future<int> buyPopup(BuildContext context, int index) async {
    print(index);
    return await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buyItem(
                        item: "Pumpkin",
                        buyingPrice: 4,
                        image: "assets/BMC/Pumpkin2.svg",
                        setStateAbove: widget.callback,
                      ),
                      buyItem(
                        item: "Wheat",
                        buyingPrice: 4,
                        image: "assets/BMC/Wheat2.svg",

                        setStateAbove: widget.callback,
                      ),
                      buyItem(
                        item: "Corn",
                        buyingPrice: 4,
                        image: "assets/BMC/Corn2.svg",

                        setStateAbove: widget.callback,
                      ),
                    ],
                  ),
                )),
          );
        });
  }

  int calcSellingPrice(index) {
    int score = 0;
    var value = farmScores.entries.elementAt(index).value;
    value.forEach((element) {
      if (element.selected) {
        score = score + element.score;
      }
    });
    print(score);
    return score;
  }

  Future<int> sellPopup(BuildContext context, int index, int vegetable) async {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var item;
    var image;
    if (vegetable == 1) {
      item = "Pumpkin";
      image = "assets/BMC/Pumpkin2.svg";
    } else if (vegetable == 2) {
      item = "Wheat";
      image = "assets/BMC/Wheat2.svg";
    } else if (vegetable == 3) {
      item = "Corn";
      image = "assets/BMC/Corn2.svg";
    } else {
      print("SOME ERROR WITH SELL");
    }
    int sellingPrice = calcSellingPrice(index);
    return await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
                child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:[ Row(
                          children: [
                            SvgPicture.asset("$image"),
                            Container(width: width*0.02),
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
                                Text("Selling Price: $sellingPrice",
                                    style: TextStyle(
                                      fontFamily: 'MohaveRegular',
                                      color: Color(0xffb36642),
                                      fontSize: height * 0.02,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )),

                                ElevatedButton(
                                    child: Text(
                                      "Sell",
                                      style: TextStyle(
                                          fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                          color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.green),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                            ))),
                                    onPressed: () {
                                      if(sellingPrice>10){
                                        showSimpleNotification(Text("Congratulations, You have earned a lot of points by selecting some very good farm management options"), duration: Duration(seconds:10));
                                      }
                                      setState(() {
                                        inProgress=false;
                                        vegetableCode=0;
                                        deadline=null;
                                        currentProgress.rewards=currentProgress.rewards+sellingPrice;
                                      });
                                      widget.callback();
                                      userDocReference
                                          .collection("BMCFarmFields")
                                          .doc("${widget.index}")
                                          .set({
                                        "vegetable": 0,
                                        "deadline": null
                                      });
                                      userDocReference.update({"rewards" : FieldValue.increment(sellingPrice)});
                                      Navigator.pop(context);
                                    }),
                              ],
                            )
                          ],
                        ),
                          Text("This price is based on the chosen ${farmScores.entries.elementAt(widget.index).key} \nTry modifying the farm management options to understand how a Business Model Canvas is essential for any business. \n You can work your way up the leaderboard by doing this!",
                              style: TextStyle(
                                fontFamily: 'MohaveRegular',
                                color: Color(0xffb36642),
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        ])
                )),
          );
        });
  }

  ///Indicate Level Here
  String getImage() {
    if (deadline == null) {
      return "assets/BMC/F1.svg";
    } else {
      Duration timediff = deadline.difference(DateTime.now());
      if (timediff.isNegative) {
        _everySecond.cancel();
        //Deadline crossed
        if (vegetableCode == 1) {
          return "assets/BMC/Pumpkin2.svg";
        } else if (vegetableCode == 2) {
          return "assets/BMC/Wheat2.svg";
        } else if (vegetableCode == 3) {
          return "assets/BMC/Corn2.svg";
        } else {
          return "assets/BMC/F1.svg";
        }
      } else if (timediff.inMinutes < HalfwayTime) {
        //Deadline almost over
        if (vegetableCode == 1) {
          return "assets/BMC/Pumpkin1.svg";
        } else if (vegetableCode == 2) {
          return "assets/BMC/Wheat1.svg";
        } else if (vegetableCode == 3) {
          return "assets/BMC/Corn1.svg";
        } else {
          return "assets/BMC/F1.svg";
        }
      } else {
        return "assets/BMC/F2.svg";
      }
    }
  }
  void initState() {
    vegetableCode = widget.farm.vegetableCode;
    deadline = widget.farm.deadline;
    if (deadline != null) {
      timediff = deadline.difference(DateTime.now());
      inProgress = true;
    }
    if (inProgress) {
      _everySecond = Timer.periodic(Duration(seconds: 10), (Timer t) {
        if(mounted) {
          setState(() {
            timediff = deadline.difference(DateTime.now());
          });
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () async {
          //print(vegetables);
          if (vegetableCode == 0) {
            if(currentProgress.rewards<4){
              showSimpleNotification(Text("You do not have enough money to make the purchase. First go attempt the design thinking module to earn some more coins"), duration : Duration(seconds:5));
            }else {
              var code = await buyPopup(context, widget.index);
              if (code != null) {
                setState(() {
                  vegetableCode = code;
                  deadline =
                      DateTime.now().add(Duration(minutes: totalTime));
                  //widget.farm.vegetableCode = code;
                  //widget.farm.deadline = DateTime.now().add(Duration(minutes: totalTime));
                  inProgress = true;
                  timediff = deadline.difference(DateTime.now());
                });
                _everySecond = Timer.periodic(Duration(seconds: 10), (Timer t) {
                  if (mounted) {
                    setState(() {
                      timediff = deadline.difference(
                          DateTime.now());
                    });
                  }
                });
                userDocReference
                    .collection("BMCFarmFields")
                    .doc("${widget.index}")
                    .set({
                  "vegetable": vegetableCode,
                  "deadline": deadline.millisecondsSinceEpoch
                });
              }
            }
          } else if (inProgress && timediff.isNegative) {

            _everySecond.cancel();
            if (calcSellingPrice(widget.index) < 0) {
              showSimpleNotification(Text(
                  "You have not selected good ${farmScores.entries.elementAt(widget.index).key} and will have to sell at a loss. We recommend going through the farm management and looking at better ways to set up your farm"), duration: Duration(seconds: 5),background: Colors.redAccent );
            }else{
              await sellPopup(context, widget.index, vegetableCode);
            }
          }
          else{
            timediff = deadline.difference(DateTime.now());
            showSimpleNotification(Text("Your plot is still farming and is not ready for harvest. Please wait for ${timediff.inMinutes+1} minutes"),background: Colors.redAccent);
          }
        },
        child: Container(
            padding: EdgeInsets.all(3),
            child: SvgPicture.asset(getImage())),
      ),
      inProgress
          ? timediff.isNegative
          ? Align(
          alignment: Alignment.topRight,
          child: Icon(Icons.assignment_late))
          : Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            child: LinearProgressIndicator(
              color: Colors.white70,
              backgroundColor: Colors.white,
              minHeight: MediaQuery.of(context).size.height * 0.007,
              valueColor:
              AlwaysStoppedAnimation<Color>(Colors.orange),
              value: (totalTime - timediff.inMinutes)/totalTime,
            ),
          ),
        ),
      )
          : Container(),
    ]);
  }
}


class buyItem extends StatelessWidget {
  final String item;
  final int buyingPrice;
  final String image;
  final Function setStateAbove;

  buyItem({
    Key key,
    @required this.item,
    @required this.buyingPrice,
    @required this.image,
    this.setStateAbove
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SvgPicture.asset("$image"),
        Container(width: width*0.02),
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
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                onPressed: () {
                  currentProgress.rewards = currentProgress.rewards-buyingPrice;
                  setStateAbove();
                  userDocReference.update({"rewards" : FieldValue.increment(-buyingPrice)});
                  Navigator.pop(context,
                      item == "Pumpkin" ? 1 : (item == "Wheat" ? 2 : 3));
                }),
          ],
        )
      ],
    );
  }
}