import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:overlay_support/overlay_support.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';

final databaseReference = FirebaseFirestore.instance;

class PasswordCheckError implements Exception {
  PasswordCheckError();
}

class LoginMethodUnknown implements Exception {
  List possibleLoginMethods;
  LoginMethodUnknown(this.possibleLoginMethods);
}

class LoginMethodsNotChecked implements Exception {
  LoginMethodsNotChecked();
}

class LoginSettings {
  bool checkingCompleted = false;
  bool isNewUser = false;
  bool isEmailID = false;
  bool isGoogle = false;
  bool isFacebook = false;
  bool isApple = false;
  List loginMethods;

  LoginSettings(
      {this.checkingCompleted = false,
      this.isNewUser = false,
      this.isEmailID = false,
      this.isGoogle = false,
      this.isFacebook = false,
      this.isApple = false});
}

abstract class BaseAuth {
  Future<User> signIn({@required String email, @required String password});

  Future<LoginSettings> getLoginSettings({@required String email});

  Future<User> signUp(
      {@required String email, @required String password, String password2});

  Future<User> allLoginMethodsUsingEmail(
      {@required LoginSettings loginSettings,
      @required String email,
      String password,
      String password2});

  User getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();

  Future<void> loginWithPhoneNumber({@required String phoneNumber});

  Future<User> signInWithOTP({String otpCode});

  Future<User> signInWithGoogle(); // Uncomment Line 8, 75, 197, 316-338

  //Future<User> signInWithFacebook();// Uncomment Line 9 , 198, 338 - 374

  //Future<FacebookLoginResult> handleFBSignIn(); // Uncomment Line 9, 198, 338 - 374

  //Future<User> signInWithApple(); // Uncomment Line 10, 199, 374 - 431

  //Future<bool> checkAppleSignIn(); // Uncomment Line 10, 199, 374 - 431
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static String _smsVerificationCode;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User> signIn(
      {@required String email, @required String password}) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (e) {
      showSimpleNotification(Text(e.message), background: Color(0xff29a39d));
      throw (e);
    }
  }

  Future<List> _emailLoginMethods({@required String email}) async {
    var methods = await _firebaseAuth.fetchSignInMethodsForEmail(email);
    return methods;
  }

  /// Check for existing login using the email ID provided
  /// returns an object with the following
  /// FIRST USE checkingCompleted. Only if true, show the rest of the UI
  /// isNewUser : boolean ()
  /// isEmailId : boolean (tells if user has used email)
  /// isGoogle : boolean (Tells if user has used google)
  /// isFacebook : boolean (tells if user has used facebook)
  /// isApple : boolean (tells if user has used Apple)
  Future<LoginSettings> getLoginSettings({@required String email}) async {
    LoginSettings loginSettings = new LoginSettings();
    if (email.length == 0) {
      showSimpleNotification(Text("Please enter an email ID"),
          background: Color(0xff29a39d));

      loginSettings.checkingCompleted = false;
    } else {
      RegExp emailCheck = new RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
      if (emailCheck.hasMatch(email)) {
        loginSettings.checkingCompleted = true;
        List loginMethods = await _emailLoginMethods(email: email);
        if (loginMethods.isEmpty) {
          loginSettings.isNewUser = true;
        } else {
          loginSettings.isNewUser = false;

          if (loginMethods.indexOf("password") == -1) {
            bool loginMethodIdentified = false;
            if (loginMethods.contains("google.com")) {
              loginMethodIdentified = true;
              loginSettings.isGoogle = true;
            }
            if (loginMethods.contains("facebook.com")) {
              loginMethodIdentified = true;
              loginSettings.isFacebook = true;
            }
            if (loginMethods.contains("apple.com")) {
              loginMethodIdentified = true;
              loginSettings.isApple = true;
            }
            if (!loginMethodIdentified) {
              loginSettings.loginMethods = loginMethods;
            }
          } else {
            loginSettings.isEmailID = true;
          }
        }
      } else {
        showSimpleNotification(Text("Please enter a valid email ID"),
            background: Color(0xff29a39d));
        loginSettings.checkingCompleted = false;
      }
    }
    return loginSettings;
  }

  Future<User> signUp(
      {@required String email,
      @required String password,
      String password2}) async {
    if (password2 == null) {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      user.sendEmailVerification();
      return user;
    } else {
      if (password == password2) {
        UserCredential result = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        User user = result.user;
        user.sendEmailVerification();
        return user;
      } else {
        throw PasswordCheckError();
      }
    }
  }

  /// Need to enable the respective authentication providers in firebase, set it up and uncomment in auth.dart
  /// Use this method once you have sent the OTP to control login for phoneNumber
  Future<User> allLoginMethodsUsingEmail(
      {@required LoginSettings loginSettings,
      @required String email,
      String password,
      String password2}) async {
    if (loginSettings.checkingCompleted) {
      if (loginSettings.isNewUser) {
        return await signUp(
            email: email, password: password, password2: password2);
      } else {
        if (loginSettings.isEmailID)
          return await signIn(email: email, password: password);
        else if (loginSettings.isGoogle)
          return await signInWithGoogle();
        //else if(loginSettings.isFacebook) return await signInWithFacebook();
        //else if(loginSettings.isApple) return await signInWithApple();
        else
          throw LoginMethodUnknown(loginSettings.loginMethods);
      }
    } else
      throw LoginMethodsNotChecked();
  }

  User getCurrentUser() {
    User user = _firebaseAuth.currentUser;
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    User user = _firebaseAuth.currentUser;
    await user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    User user = _firebaseAuth.currentUser;
    await user.reload();
    return user.emailVerified;
  }

  Future<void> loginWithPhoneNumber({@required String phoneNumber}) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 30),
        verificationCompleted: (authCredential) =>
            _verificationComplete(authCredential),
        verificationFailed: (authException) =>
            _verificationFailed(authException),
        codeAutoRetrievalTimeout: (verificationId) =>
            _codeAutoRetrievalTimeout(verificationId),
        // called when the SMS code is sent
        codeSent: (verificationId, [code]) =>
            _smsCodeSent(verificationId, [code]),
      );
    } catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future<void> _smsCodeSent(String verificationId, List<int> code) async {
    print("********************CODE SENT*****************");
    _smsVerificationCode = verificationId;
  }

  Future<User> _verificationComplete(AuthCredential _authCredential) async {
    try {
      UserCredential value =
          await _firebaseAuth.signInWithCredential(_authCredential);
      if (value.user != null) {
        return value.user;
      } else {
        showSimpleNotification(Text('Invalid Code'),
            background: Color(0xff29a39d));
        return null;
      }
    } catch (e) {
      showSimpleNotification(Text('Something has gone wrong, please try later'),
          background: Color(0xff29a39d));
    }
    return null;
  }

  Future<void> _verificationFailed(FirebaseAuthException authException) async {
    if (authException.message.contains('not authorized'))
      showSimpleNotification(
          Text('Login Failure, Something has gone wrong, please try later'),
          background: Color(0xff29a39d));
    else if (authException.message.contains('Network'))
      showSimpleNotification(
          Text(
              'Login Failure, Please check your internet connection and try again'),
          background: Color(0xff29a39d));
    else
      showSimpleNotification(
          Text('Login Failure, Something has gone wrong, please try later'),
          background: Color(0xff29a39d));
  }

  Future<void> _codeAutoRetrievalTimeout(String verificationId) async {
    // set the verification code so that we can use it to log the user in
    _smsVerificationCode = verificationId;
//    showSimpleNotification(
//              Text('Auto Login Timed out, Please enter the code manually'),
//              background: Color(0xff29a39d));
  }

  Future<User> signInWithOTP({String otpCode}) async {
    if (otpCode.length != 6) {
      showSimpleNotification(Text('Invalid OTP. OTP needs to be of 6 digits'),
          background: Color(0xff29a39d));
      return null;
    } else {
      var _authCredential = PhoneAuthProvider.credential(
          verificationId: _smsVerificationCode, smsCode: otpCode);
      try {
        UserCredential result =
            await _firebaseAuth.signInWithCredential(_authCredential);
        if (result.user != null) {
          return result.user;
        }
      } catch (e) {
        showSimpleNotification(
            Text('Login Failure, Something has gone wrong, please try later'),
            background: Color(0xff29a39d));
      }
      return null;
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);
    final User user = userCredential.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _firebaseAuth.currentUser;
    assert(user.uid == currentUser.uid);

    return user;
  }

  /*Future<User> signInWithFacebook() async {
    FacebookLoginResult facebookLoginResult = await handleFBSignIn();
    final accessToken = facebookLoginResult.accessToken.token;
    if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
      final facebookAuthCred = FacebookAuthProvider.credential(accessToken);
      final user = await _firebaseAuth.signInWithCredential(facebookAuthCred);
      return user.user;
    }
  }

  Future<FacebookLoginResult> handleFBSignIn() async {
    FacebookLogin facebookLogin = FacebookLogin();
    FacebookLoginResult facebookLoginResult =
        await facebookLogin.logIn(['email']);
    final token = facebookLoginResult.accessToken.token;
    final graphResponse = await http.get(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.cancelledByUser:
        print("Cancelled");
        break;
      case FacebookLoginStatus.error:
        print("error");
        break;
      case FacebookLoginStatus.loggedIn:
        print("Logged In");
        break;
    }
    return facebookLoginResult;
  }

   */

  /*Future<bool> checkAppleSignIn() async {
    bool supportsAppleSignIn =
        false; // this bool will be true if apple sign in is enabled
    if (Platform.isIOS) {
      supportsAppleSignIn = await AppleSignIn.isAvailable();
    }
    return supportsAppleSignIn;
  }

  Future<User> signInWithApple() async {
    try {
      final AuthorizationResult result = await AppleSignIn.performRequests([
        AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
      ]);

      switch (result.status) {
        case AuthorizationStatus.authorized:
          try {
            print("successfull sign in");
            final AppleIdCredential appleIdCredential = result.credential;

            OAuthProvider oAuthProvider = new OAuthProvider("apple.com");
            final AuthCredential credential = oAuthProvider.credential(
              idToken: String.fromCharCodes(appleIdCredential.identityToken),
              accessToken:
                  String.fromCharCodes(appleIdCredential.authorizationCode),
            );

            final UserCredential resultApple =
                await _firebaseAuth.signInWithCredential(credential);
            User user = resultApple.user;
            user.updateProfile(
                displayName:
                    "${appleIdCredential.fullName.givenName} ${appleIdCredential.fullName.familyName}");
          } catch (e) {
            showSimpleNotification(Text(e.message),
                background: Color(0xff29a39d));
          }
          break;
        case AuthorizationStatus.error:
          showSimpleNotification(
              Text("There was an error with Authentication. Please try again"),
              background: Color(0xff29a39d));
          break;

        case AuthorizationStatus.cancelled:
          showSimpleNotification(
              Text("You have cancelled login. Please try with another method"),
              background: Color(0xff29a39d));
          break;
      }
    } catch (error) {
      showSimpleNotification(Text(error.message),
          background: Color(0xff29a39d));
    }
  }

   */
}
