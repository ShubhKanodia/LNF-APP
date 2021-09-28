import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/Persona.dart';

import 'package:learnnfun/auth.dart';
import 'package:learnnfun/overallPages/levels.dart';

class RegistrationInfo extends StatefulWidget {
  @override
  _RegistrationInfoState createState() => _RegistrationInfoState();
}

class _RegistrationInfoState extends State<RegistrationInfo> {
  TextEditingController name = new TextEditingController();
  double age = 20;
  String profileSelected;
  bool _isEditingText = false;

  Future<Map<String,Widget>> profilePictures() async{
    Map<String,Widget> avatars = {};
    ListResult result = await FirebaseStorage.instance.ref("avatars").listAll();
    for(var ref in result.items){
      String downloadURL = await ref.getDownloadURL();
      avatars[ref.fullPath] =  Container(
        width:MediaQuery.of(context).size.width*0.35 ,
          height: MediaQuery.of(context).size.height*0.35,
          padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
          margin: EdgeInsets.only(top: 10,bottom: 20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0x1f000000),
                  offset: Offset(2,4),
                  blurRadius: 4,
                  spreadRadius: 4
              )] ,
              color: const Color(0xffffffff)
          ),
        child:  Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.scaleDown,
                image: NetworkImage(downloadURL),
              ),
            )),
      );
    }
    return avatars;

  }

  Future<Map<String,Widget>> profilePicturesFuture;

  void initState(){
    super.initState();

    userDocReference.get().then((DocumentSnapshot<Map<String,dynamic>> value){
      if(value.data()!=null) {
        setState(() {
          name.text = value.data()["name"];
          age = value.data()["age"];
        });
      }
    });
    profilePicturesFuture = profilePictures();
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
                          FutureBuilder(
                            future: profilePicturesFuture,
                            builder: (context, AsyncSnapshot<Map<String,Widget>> snapshot) {
                              if(snapshot.hasData && snapshot.data!=null) {
                                return Container(
                                  height: height*0.15,
                                  width: width,

                                  child: CarouselSlider(
                                      items: snapshot.data.values.toList(),
                                      options: CarouselOptions(
                                        viewportFraction: 0.2,
                                        enableInfiniteScroll: true,
                                        pageSnapping: true,
                                        enlargeCenterPage: true,
                                        onPageChanged: (index, reason) {
                                          profileSelected = snapshot.data.keys.elementAt(index);
                                        },
                                        scrollDirection: Axis.horizontal,
                                      )),
                                );
                              }else return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      child: CircularProgressIndicator(),
                                  margin:EdgeInsets.only(top: height*0.05)
                                  ),
                                ],
                              );
                            }
                          ),
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
                          if(_isEditingText)
                            Row(
                              children: [
                                Text("Age : ",
                                    style: GoogleFonts.quicksand(
                                        color: const Color(0xff1a1b41),
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: height * 0.02)),
                                Container(
                                  width: 50,
                                  height:10,
                                  child: TextField(
                                    onSubmitted: (newValue){
                                      age = double.parse(newValue);
                                      _isEditingText=false;
                                    }
                              ),
                                ),]
                            ),
                          if(!_isEditingText)
                            InkWell(
                              onTap:(){
                                setState((){
                                  _isEditingText=true;
                                  });
                               },
                                child: Text("Age : ${age.toInt()}",
                                    style: GoogleFonts.quicksand(
                                        color: const Color(0xff1a1b41),
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: height * 0.02)),
                              ),
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
                                      Auth().getCurrentUser().updateDisplayName(name.text);
                                    if (profileSelected != null)
                                      Auth().getCurrentUser().updatePhotoURL(profileSelected);
                                    if ((await userDocReference
                                            .get())
                                        .exists)
                                      userDocReference
                                          .update({
                                        "name": name.text,
                                        "profile": profileSelected,
                                        "age": age
                                      });
                                    else
                                      userDocReference
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
