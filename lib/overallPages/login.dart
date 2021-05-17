import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/overallPages/introductionSlider.dart';
import 'package:learnnfun/overallPages/levels.dart';
import 'package:overlay_support/overlay_support.dart';

import '../auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailId;
  TextEditingController password;
  TextEditingController password2;

  bool userChecked = false;
  LoginSettings loginSettings = LoginSettings();
  bool loading = false;
  bool googleLoading = false;

  void setLoginSettings() async {
    FocusScope.of(context).unfocus();
    setState(() {
      loading = true;
    });
    Auth().getLoginSettings(email: emailId.text).then((value) {
      setState(() {
        loginSettings = value;
        loading = false;
      });
    });
  }

  void initState() {
    emailId = new TextEditingController();
    password = new TextEditingController();
    password2 = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.07, right: width * 0.07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: height * 0.045),
                    child: Text("Welcome",
                        style: GoogleFonts.quicksand(
                            color: Color(0xff16697a),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.05))),
                Text("Please Login or Sign Up to secure your account",
                    style: GoogleFonts.quicksand(
                        color: Color(0xff16697a),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: height * 0.02)),
                SizedBox(height: height * 0.09),
                Text(
                    loginSettings.checkingCompleted
                        ? loginSettings.isNewUser
                            ? "Sign Up"
                            : loginSettings.isEmailID
                                ? "Login"
                                : loginSettings.isGoogle
                                    ? "Use Google Sign In"
                                    : loginSettings.loginMethods.first
                        : "Login/Sign Up",
                    style: GoogleFonts.quicksand(
                        color: Color(0xffffa62b),
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: height * 0.04),
                    textAlign: TextAlign.center),
                SizedBox(height: height * 0.09),
                Text("Enter your Email ID",
                    style: GoogleFonts.quicksand(
                        color: const Color(0xff1a1b41),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: height * 0.02)),
                TextField(
                  onEditingComplete: setLoginSettings,
                  controller: emailId,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "testing@pes.edu",
                    suffixIcon: loading
                        ? CircularProgressIndicator()
                        : IconButton(
                            icon: Icon(Icons.check),
                            onPressed: setLoginSettings,
                          ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                loginSettings.checkingCompleted
                    ? Text("Enter your password",
                        style: GoogleFonts.quicksand(
                            color: const Color(0xff1a1b41),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.02))
                    : Container(),
                loginSettings.checkingCompleted
                    ? loginSettings.isNewUser
                        ? TextField(
                            controller: password,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Set your password",
                            ),
                          )
                        : loginSettings.isEmailID
                            ? TextField(
                                controller: password,
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: "Enter your password",
                                ),
                              )
                            : Container()
                    : Container(),
                loginSettings.checkingCompleted
                    ? loginSettings.isNewUser
                        ? TextField(
                            controller: password2,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Repeat your password"),
                          )
                        : Container()
                    : Container(),
                // Rectangle
                SizedBox(height: height * 0.09),

                ElevatedButton(
                    child: Text(
                        loginSettings.checkingCompleted
                            ? loginSettings.isNewUser
                                ? "Sign Up"
                                : loginSettings.isEmailID
                                    ? "Login"
                                    : loginSettings.isGoogle
                                        ? "Use Google Sign In"
                                        : loginSettings.loginMethods.first
                            : "Check email ID",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: height * 0.025),
                        textAlign: TextAlign.left),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.resolveWith<double>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) return 5;
                          return 0; // Use the component's default.
                        },
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                          Size(width, height * 0.06)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Color(0xffffa62b);
                          return Color(
                              0xffffa62b); // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () async {
                      try {
                        User user = await Auth().allLoginMethodsUsingEmail(
                            loginSettings: loginSettings,
                            email: emailId.text,
                            password: password.text,
                            password2: password2.text);
                        if (user.displayName == null) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IntroductionSlider(),
                                settings:
                                    RouteSettings(name: 'Profile Creation')),
                            (Route<dynamic> route) => false,
                          );
                        } else {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Levels(),
                                settings: RouteSettings(
                                    name: 'Levels')),
                                (Route<dynamic> route) => false,
                          );
                        }
                      } on PasswordCheckError {
                        showSimpleNotification(
                            Text("The passwords do not match"));
                      } on LoginMethodsNotChecked {
                        setLoginSettings();
                      } on LoginMethodUnknown catch (loginMethods) {
                        showSimpleNotification(Text(
                            "Please use ${loginMethods.possibleLoginMethods.first} "));
                      }
                    }),
                SizedBox(height: height * 0.05),
                Row(children: <Widget>[
                  Expanded(child: Divider()),
                  Text("OR"),
                  Expanded(child: Divider()),
                ]),
                SizedBox(height: height * 0.05),
                OutlinedButton.icon(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(
                          Size(width, height * 0.06)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                      )),
                      side: MaterialStateProperty.all<BorderSide>(BorderSide(
                          color: Color(0xffffa62b), width: width * 0.005))),
                  onPressed: () {
                    if(!googleLoading) {
                      setState(() {
                        googleLoading = true;
                      });
                      Auth().signInWithGoogle().then((value) {
                        userDocReference.get().then((snapshot) {
                          setState(() {
                            googleLoading = true;
                          });
                          if (!snapshot.exists) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IntroductionSlider(),
                                  settings:
                                  RouteSettings(name: 'Profile Creation')),
                                  (Route<dynamic> route) => false,
                            );
                          } else {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Levels(),
                                  settings: RouteSettings(
                                      name: 'Levels')),
                                  (Route<dynamic> route) => false,
                            );
                          }
                        });
                      });
                    }
                  },
                  icon: Image.asset(
                    "assets/google.png",
                    scale: height * 0.004,
                  ),
                  label: googleLoading?CircularProgressIndicator():Text("Login through Google",
                      style: GoogleFonts.quicksand(
                          color: const Color(0xffffa62b),
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: height * 0.025),
                      textAlign: TextAlign.left),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
