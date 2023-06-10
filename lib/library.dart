import 'dart:ui';
import 'BusinessModelCanvas/IntroCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/DesignThinking/widgets.dart';

///Library class for any other resources we want to add
///Pass the following values to control content
///0 - All
///1 - Design Thinking
///2 - BMC
class Library extends StatefulWidget {
  ///Code is to decide what are the topics to show.
  ///Currently
  ///0 - All
  ///1 - Design Thinking
  ///2 - Business Model Canvas
  final int code;

  ///Library class for any other resources we want to add\n
  ///Pass the following values to control content\n
  ///0 - All\n
  ///1 - Design Thinking\n
  ///2 - BMC\n
  Library({Key key, @required this.code}) : super(key: key);
  @override
  _Library createState() => _Library();
}

class _Library extends State<Library> {
  bool showSaved = false;

  setStateCallback(Function fn) {
    setState(() {
      fn();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StdBackButton(),
                IconButton(
                  icon:
                      Icon(showSaved ? Icons.bookmark : Icons.bookmark_outline),
                  color: Color(0xffffa62b),
                  onPressed: () {
                    setState(() {
                      showSaved = !showSaved;
                    });
                  },
                ),
              ],
            ),
            Text(
              "Library",
              style: GoogleFonts.signika(
                  textStyle: TextStyle(
                      color: const Color(0xff9c27b0),
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: height * 0.06)),
            ),
            Text("learn more!",
                style: GoogleFonts.signika(
                  color: Color(0xff9c27b0),
                  fontSize: height * 0.025,
                  fontWeight: FontWeight.bold,
                )),
            DefaultTabController(
              length: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: height * 0.05,
                    child: TabBar(indicatorColor: Color(0xff5b3b8c), tabs: [
                      Tab(
                        child: Text("Article ",
                            style: GoogleFonts.signika(
                              color: Color(0xff9c27b0),
                              fontSize: height * 0.035,
                            )),
                      ),
                      Tab(
                        child: Text("Videos",
                            style: GoogleFonts.signika(
                              color: Color(0xff9c27b0),
                              fontSize: height * 0.035,
                            )),
                      ),
                    ]),
                  ),
                  Container(
                    height: height * 0.8,
                    child: TabBarView(children: [
                      ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: topicList.length,
                        itemBuilder: (BuildContext context, int index) {
                          Topic topic = topicList[index];
                          if (showSaved) {
                            if (topic.saved) {
                              return Article(
                                topic: topic,
                                setStateCallback: setStateCallback,
                              );
                            } else
                              return Container();
                          } else {
                            return Article(
                                topic: topic,
                                setStateCallback: setStateCallback);
                          }
                        },
                      ),
                      Icon(Icons.video_collection_outlined, size: 350),
                    ]),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class Article extends StatelessWidget {
  const Article({
    Key key,
    @required this.topic,
    @required this.setStateCallback,
  }) : super(key: key);

  final Topic topic;
  final Function setStateCallback;
  @override
  Widget build(BuildContext context) {
    print(topic.title);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: WhiteScreen(
            height: height * 0.5,
            width: width * 0.9,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/designThinking.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(topic.title,
                          style: GoogleFonts.signika(
                              color: Color(0xffb19cd9),
                              fontSize: height * 0.035,
                              fontWeight: FontWeight.bold)),
                      Text("Article by " + topic.by,
                          style: GoogleFonts.signika(
                            color: Color(0xff5b3b8c),
                            fontSize: height * 0.015,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Read article",
                              style: GoogleFonts.signika(
                                  color: Color(0xff5b3b8c),
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold)),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: IconButton(
                                icon: Icon(topic.saved
                                    ? Icons.bookmark
                                    : Icons.bookmark_outline),
                                color: Color(0xff5b3b8c),
                                iconSize: height * 0.04,
                                onPressed: () {
                                  setStateCallback(() {
                                    topic.saved = !topic.saved;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //alignment: Alignment.centerRight,
            ],
          ),
        ),
      ],
    );
  }
}

class Topic {
  final String title;
  final String by;
  bool saved = false;

  Topic({@required this.title, @required this.by, this.saved});
}

final topicList = [
  Topic(
    title: "What is Design Thinking and why is it important?",
    by: "Rim Razzouk, Valerie Shute",
    saved: false,
  ),
  Topic(
    title: "Design Thinking the BASICS",
    by: "_______",
    saved: false,
  ),
  Topic(
    title: "Jessica",
    by: "_______",
    saved: false,
  ),
  Topic(
    title: "Jessica",
    by: "_______",
    saved: false,
  ),
];
