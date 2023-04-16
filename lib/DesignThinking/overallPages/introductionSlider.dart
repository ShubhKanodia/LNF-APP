// ignore_for_file: unused_import

import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/DesignThinking/overallPages/levels.dart';
import 'package:learnnfun/registerInfo.dart';
import 'package:learnnfun/DesignThinking/widgets.dart';

class IntroductionSlider extends StatefulWidget {
  IntroductionSlider();

  @override
  _IntroductionSliderState createState() => _IntroductionSliderState();
}

class _IntroductionSliderState extends State<IntroductionSlider> {
  int _currentPage;
  List visited = List.filled(slideList.length + 1, 0);
  final PageController _pageController = PageController(initialPage: 0);
  Timer _timer;
  bool buttonVisible = false;

  @override
  void initState() {
    super.initState();

    _currentPage = 0;
    _timer = Timer.periodic(Duration(milliseconds: 2500), (Timer timer) {
      if (_currentPage < slideList.length) {
        _currentPage++;
      }
      if (visited[_currentPage] == 0) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
      if (_currentPage == slideList.length - 1 ||
          _currentPage == slideList.length - 1) {
        setState(() {
          buttonVisible = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      if (visited[index] == 1) {
        _currentPage = index;
      } else {
        _currentPage = index;
        visited[index] = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(width / 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height / 40, horizontal: width / 9),
                  child: Container(
                    child: Text(
                      "Learn N Fun",
                      style: GoogleFonts.quicksand(
                          color: Color(0xFF9400d3),
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: height * 0.04),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        onPageChanged: _onPageChanged,
                        itemCount: slideList.length,
                        itemBuilder: (context, i) => SlideItem(i),
                      ),
                    ],
                  ),
                ),
                Visibility(
                    visible: buttonVisible,
                    child: StandardButton(
                        text: "Get Started",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Levels()));
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SlideItem extends StatelessWidget {
  final int index;

  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    double temp = index.toDouble();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        WhiteScreen(height: height * 0.5, children: [
          SvgPicture.asset(slideList[index].imageUrl,
              width: width / 3, height: height / 3.5, fit: BoxFit.fitHeight)
        ]),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 15),
          child: Container(
            child: Text(
              slideList[index].description,
              style: GoogleFonts.quicksand(
                  color: const Color(0xff16697a),
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: height * 0.03),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: height * 0.05),
          child: DotsIndicator(
            dotsCount: slideList.length,
            position: temp,
            decorator: DotsDecorator(
                activeColor: Color(0xff489fb5), color: Color(0x4d489fb5)),
          ),
        ),
      ],
    );
  }
}

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/introductionSlider/slide1.svg',
    title: 'Learn N Fun',
    description:
        'Design Thinking is a creative approach to problem-solving and is a great way to address any problem, regardless of content.',
  ),
  Slide(
    imageUrl: 'assets/introductionSlider/slide2.svg',
    title: 'Learn N Fun',
    description:
        'Through fun games and activities, you will learn about the various stages of the Design Thinking Process.',
  ),
  Slide(
    imageUrl: 'assets/introductionSlider/slide3.svg',
    title: 'Learn N Fun',
    description:
        'Complete tasks to earn rewards and pave your path towards being a Design Thinker!',
  ),
];
