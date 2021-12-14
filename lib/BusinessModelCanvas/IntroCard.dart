import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/BusinessModelCanvas/data.dart';
import 'package:learnnfun/DesignThinking/widgets.dart';

import 'homeScreen.dart';

class BMCIntro extends StatelessWidget {

  List<FarmLandData> farmLandInfo;

  BMCIntro({
    Key key,
    @required this.farmLandInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.02, right: width * 0.02, top: height * 0.01),
              child: Column(
                children: [
                  StdBackButton(),
                  Padding(padding: EdgeInsets.only(bottom: height * 0.05),
                    child:
                    Text(
                      "Grow a Farm",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                          color: Color(0xff489fb5),
                          fontSize: height * 0.045,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      height: height * 0.1,
                      width: width * 0.4,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.03),
                          child: SvgPicture.asset("assets/BMC/Corn2.svg"),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: width * 0.13, right: width * 0.13 , top: height * 0.1, bottom: height * 0.02),
                    child: Text(
                      "Grow your farm by using various components of the Business Model Canvas",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                          color: Color(0xff489fb5),
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                  ,
                  Padding(padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08 , top: height * 0.01, bottom: height * 0.02),
                    child: Text(
                      "Through this experience, you will understand how the components of a BMC work for a farm and can then expand it to any domain",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        color: Color(0xff489fb5),
                        fontSize: height * 0.025,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08 , top: height * 0.01, bottom: height * 0.02),
                    child: Text(
                      "You need to plant various vegetables and then manage your farm to control the yield you get from the crops. Keep trying multiple variations so you can understand",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        color: Color(0xff489fb5),
                        fontSize: height * 0.025,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StandardButton( text: "Continue", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Farm(farmLandInfo: farmLandInfo,),
                    settings: RouteSettings(name: 'Actual game')),
              );
            })
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
