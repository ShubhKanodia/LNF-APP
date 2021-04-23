import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/levels.dart';
import 'package:learnnfun/themeintro.dart';

import 'auth.dart';

class RegistrationInfo extends StatefulWidget {
  @override
  _RegistrationInfoState createState() => _RegistrationInfoState();
}

class _RegistrationInfoState extends State<RegistrationInfo> {
  TextEditingController name = new TextEditingController();
  double age = 20;
  String profileSelected;
  List<String> profilePictureURL = [
    "https://i.pravatar.cc/300",
    "https://i.pravatar.cc/300"
  ];

  List<Widget> profilePictures(height) {
    List<Widget> avatars = [];
    for (int i = 0; i < profilePictureURL.length; i++) {
      avatars.add(Container(
          child: CircleAvatar(
        radius: height * 0.1,
        backgroundImage: NetworkImage(profilePictureURL[i]),
      )));
    }
    return avatars;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff4f4f4),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.07, right: width * 0.07),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Padding(
                                  padding: EdgeInsets.only(top: height * 0.045),
                                  child: Text("Your Profile",
                                      style: GoogleFonts.quicksand(
                                          color: Color(0xffffa62b),
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: height * 0.05)))),
                          Padding(
                              padding: EdgeInsets.only(top: height * 0.045),
                              child: Text("Choose an Avatar",
                                  style: GoogleFonts.quicksand(
                                      color: Color(0xff1a1b41),
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: height * 0.03))),
                          CarouselSlider(
                              items: profilePictures(height),
                              options: CarouselOptions(
                                viewportFraction: 0.28,
                                aspectRatio: 3,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                pageSnapping: true,
                                enlargeCenterPage: true,
                                onPageChanged: (index, reason) {
                                  profileSelected = profilePictureURL[index];
                                },
                                scrollDirection: Axis.horizontal,
                              )),
                          SizedBox(height: height * 0.09),
                          Text("Name",
                              style: GoogleFonts.quicksand(
                                  color: const Color(0xff1a1b41),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: height * 0.02)),
                          TextField(
                            controller: name,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "John Smith",
                            ),
                          ),
                          SizedBox(height: height * 0.09),
                          Text("Age",
                              style: GoogleFonts.quicksand(
                                  color: const Color(0xff1a1b41),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: height * 0.02)),
                          Text("Select your age from the slider below:",
                              style: GoogleFonts.quicksand(
                                  color: Color(0xff16697a),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: height * 0.02)),
                          SizedBox(height: height * 0.04),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              valueIndicatorColor: Color(
                                  0xffffa62b), // This is what you are asking for
                              inactiveTrackColor:
                                  Color(0x33ffa62b), // Custom Gray Color
                              activeTrackColor: Color(0xffffa62b),
                              thumbColor: Color(0xffffffff),
                              overlayColor: Color(
                                  0xffffa62b), // Custom Thumb overlay Color
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 12.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 10.0),
                            ),
                            child: Slider(
                              min: 0,
                              max: 100,
                              value: age,
                              divisions: 100,
                              label: age.round().toString(),
                              onChanged: (value) {
                                setState(() {
                                  age = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: height * 0.09),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.2, right: width * 0.2),
                              child: ElevatedButton(
                                  child: Text("Save",
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: height * 0.025),
                                      textAlign: TextAlign.left),
                                  style: ButtonStyle(
                                    shadowColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xffcb7703)),
                                    elevation: MaterialStateProperty
                                        .resolveWith<double>(
                                      (Set<MaterialState> states) {
                                        if (states.contains(
                                            MaterialState.pressed)) return 0;
                                        return 8; // Use the component's default.
                                      },
                                    ),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            Size(width, height * 0.06)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(26.0),
                                    )),
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.pressed))
                                          return Color(0xffffa62b);
                                        return Color(
                                            0xffffa62b); // Use the component's default.
                                      },
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (name.text != null)
                                      Auth().getCurrentUser().updateProfile(
                                          displayName: name.text);
                                    if (profileSelected != null)
                                      Auth().getCurrentUser().updateProfile(
                                          photoURL: profileSelected);
                                    if ((await databaseReference
                                            .collection("users")
                                            .doc(Auth().getCurrentUser().uid)
                                            .get())
                                        .exists)
                                      databaseReference
                                          .collection("users")
                                          .doc(Auth().getCurrentUser().uid)
                                          .update({
                                        "name": name.text,
                                        "profile": profileSelected,
                                        "age": age
                                      });
                                    else
                                      databaseReference
                                          .collection("users")
                                          .doc(Auth().getCurrentUser().uid)
                                          .set({
                                        "name": name.text,
                                        "profile": profileSelected,
                                        "age": age
                                      });
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Levels(),
                                          settings: RouteSettings(
                                              name: 'Levels')),
                                      (Route<dynamic> route) => false,
                                    );
                                  }),
                            ),
                          )
                        ])))));
  }
}
