import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:digital_era_kids/view/pages/home.dart';
import 'package:digital_era_kids/view/pages/signin/login.dart';
import 'package:flushbar/flushbar.dart';

class authServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<UserCredential> signUp(String email, String password) async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return user;
  }

  LogIn(String email, String password, BuildContext context) async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen())))
        .catchError((onError) {
      print(onError.code);
      if (onError.code == "user-not-found") {
        showFlushbar(context);
      }
      print("***************");
    });
  }

  SignOut(BuildContext context) {
    auth.signOut().whenComplete(() => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Login())));
  }
}

showFlushbar(BuildContext context) {
  Flushbar(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(20),
    messageText: Text(
      "User not found",
      style: TextStyle(color: Colors.white),
    ),
    borderRadius: 10,
    backgroundColor: Colors.grey[800],
    duration: Duration(seconds: 3),
  )..show(context);
}
