import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/DesignThinking/overallPages/levels.dart';
import 'package:learnnfun/DesignThinking/widgets.dart';

import 'package:learnnfun/auth.dart';
import '../Persona.dart';
import '../data.dart';

class PersonList extends StatefulWidget {
  @override
  _PersonListState createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  get personaList =>
      currentProgress.playingLevel2 ? level2Persona : level1Persona;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                StdBackButton(),
                Text(
                  "Select a Gift Receiver",
                  style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          color: Color(0xFF9400d3),
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: height * 0.04)),
                ),
                Text("Click on the person card to know more",
                    style: GoogleFonts.quicksand(
                      color: Color(0xff9c27b0),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                Expanded(
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: personaList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Person person = personaList[index];
                      return GestureDetector(
                        onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                _PersonPopup(person: person, index: index)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                              height: height * 0.20,
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x33000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width * 0.3,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, top: 20, bottom: 20),
                                      child: SvgPicture.asset(person.imageUrl),
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Jessica Pearson
                                        Text(
                                            person.firstName +
                                                " " +
                                                person.lastName,
                                            style: GoogleFonts.quicksand(
                                                color: const Color(0xff9c27b0),
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: height * 0.02),
                                            textAlign: TextAlign.left),
                                        // A lawyer in her mid 30s, loves to cook and watch s
                                        Text(person.description,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.quicksand(
                                                color: const Color(0xff9c27b0),
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: height * 0.02),
                                            textAlign: TextAlign.left),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class _PersonPopup extends StatelessWidget {
  const _PersonPopup({Key key, @required this.person, this.index})
      : super(key: key);

  final Person person;
  final int index;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BackdropFilter(
      filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: WhiteScreen(
          height: MediaQuery.of(context).size.height * 0.7,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context))),
            Row(
              children: [
                Container(
                  height: height * 0.2,
                  child: SvgPicture.asset(person.imageUrl),
                ),
                // Jessica Pearson
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      style: GoogleFonts.quicksand(
                          color: const Color(0xff9c27b0),
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: height * 0.04),
                      text: person.firstName + "\n"),
                  TextSpan(
                      style: GoogleFonts.quicksand(
                          color: const Color(0xff9c27b0),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: height * 0.03),
                      text: person.lastName)
                ]))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Age:" + "\n",
                        style: GoogleFonts.quicksand(
                            color: const Color(0xff9c27b0),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.02),
                      ),
                      Text(
                        "Profession:" + "\n",
                        style: GoogleFonts.quicksand(
                            color: const Color(0xff9c27b0),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.02),
                      ),
                      Text(
                        "Likes:" + "\n",
                        style: GoogleFonts.quicksand(
                            color: const Color(0xff9c27b0),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.02),
                      ),
                      Text(
                        "Dislikes:" + "\n",
                        style: GoogleFonts.quicksand(
                            color: const Color(0xff9c27b0),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.02),
                      ),
                      Text(
                        "Hobbies:" + "\n",
                        style: GoogleFonts.quicksand(
                            color: const Color(0xff9c27b0),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.02),
                      ),
                    ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        person.age.toString() + "\n",
                        style: GoogleFonts.quicksand(
                            color: const Color(0xff9c27b0),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.02),
                      ),
                      Text(
                        person.profession + "\n",
                        style: GoogleFonts.quicksand(
                            color: const Color(0xff9c27b0),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.02),
                      ),
                      Text(
                        person.likes + "\n",
                        style: GoogleFonts.quicksand(
                            color: const Color(0xff9c27b0),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.02),
                      ),
                      Text(
                        person.dislikes + "\n",
                        style: GoogleFonts.quicksand(
                            color: const Color(0xff9c27b0),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.02),
                      ),
                      Text(
                        person.hobbies + "\n",
                        style: GoogleFonts.quicksand(
                            color: const Color(0xff9c27b0),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.02),
                      ),
                    ])
              ],
            ),
            StandardButton(
                text: "Select Receiver",
                onTap: () {
                  if (currentProgress.playingLevel2) {
                    userDocReference
                        .update({"taskUnlocked": 9, "l2personIndex": index});
                    currentPersonaL2 = person;
                    currentProgress.taskUnlocked = 9;
                    currentProgress.rewards += 1;
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TasksLevel2(),
                          settings: RouteSettings(name: 'Tasks')),
                      (Route<dynamic> route) => false,
                    );
                  } else {
                    userDocReference
                        .update({"taskUnlocked": 1, "l1personIndex": index});
                    currentPersonaL1 = person;
                    currentProgress.taskUnlocked = 1;
                    currentProgress.rewards = 1;
                    currentProgress.trophies = 1;
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Tasks(),
                          settings: RouteSettings(name: 'Tasks')),
                      (Route<dynamic> route) => false,
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
