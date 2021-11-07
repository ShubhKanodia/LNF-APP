import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learnnfun/DesignThinking/widgets.dart';

class ListScreen extends StatefulWidget {
  bool silo;
  ListScreen({Key key,@required this.silo}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffbdcb43),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              widget.silo?SvgPicture.asset("assets/BMC/Silo.svg"):SvgPicture.asset("assets/BMC/BMC.svg"),
              new Text(widget.silo?"Farm Resources and Products":"Farm Business",
                  style: TextStyle(
                    fontFamily: 'MohaveMedium',
                    color: Color(0xfff8ff20),
                    fontSize: height*0.02,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )
              ),
              WhiteScreen(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                width: width*0.9,
                elevation: 2,
                height: height*0.6,
                padding: 10,
                children: [
                ItemRow(sellingPrice: 20,item: "Pumpkin",quantity: 3000, image: "assets/BMC/Pumpkin2.svg",),
                ItemRow(sellingPrice: 20,item: "Wheat",quantity: 3000, image: "assets/BMC/Wheat2.svg",),
                ItemRow(sellingPrice: 20,item: "Corn",quantity: 3000, image: "assets/BMC/Corn2.svg",)


              ],),
        InkResponse(
          child: new Container(
            width: width*0.08,
            height: height*0.08,
            decoration: new BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
          ),)
            ],
          ),
        ),
      ),
    );
  }
}

class ItemRow extends StatelessWidget {
  String item;
  int quantity;
  int sellingPrice;
  String image;

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
                fontSize: height*0.025,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )
          ),
          Text("Available: $quantity",
              style: TextStyle(
                fontFamily: 'MohaveRegular',
                color: Color(0xffb36642),
                fontSize: height*0.02,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )
          ),
          Text("Selling Price :$sellingPrice",
              style: TextStyle(
                fontFamily: 'MohaveRegular',
                color: Color(0xffb36642),
                fontSize: height*0.02,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )
          ),
          Row(
            children: [
              ElevatedButton(
                  child: Text(
                      "Units  100",
                      style: TextStyle(fontSize: height*0.02,
                      color: Colors.green),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xfff2f5d8)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                          )
                      )
                  ),
                  onPressed: () => null
              ),
              ElevatedButton(
                  child: Text(
                    "2500",
                    style: TextStyle(fontSize: height*0.02,
                        color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      )
                  ),
                  onPressed: () => null
              ),
            ],
          )
        ],
      )
    ],);
  }
}
