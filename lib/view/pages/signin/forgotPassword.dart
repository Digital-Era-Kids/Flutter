import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digital_era_kids/view/pages/signin/login.dart';

class ForgotPassword extends StatefulWidget {
  // const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Color(0xff2329D6),
              padding: EdgeInsets.all(40),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: new SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          width: MediaQuery.of(context).size.width * 1,
                          child: Image.asset("assets/images/icon.jpeg")),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      "Digital Era Kids",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 36,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Forgot Password',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
            ),
            Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.only(top: 30, right: 30, left: 30),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15, top: 15),
                  child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return "Please enter email id";
                        } else if (EmailValidator.validate(value) == false) {
                          return "Enter correct email id";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Color(0xff2329D6),
                        ),
                        enabled: true,
                        hintText: "Enter email id",
                        labelText: "Email",
                        labelStyle:
                            TextStyle(color: Color(0xFFB8B6B6), fontSize: 12),
                        hintStyle: TextStyle(color: Color(0xFF737373)),
                        focusedBorder: authTfBorderOutline(true),
                        border: authTfBorderOutline(false),
                        enabledBorder: authTfBorderOutline(false),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: email.text)
                      .then((value) {
                     showFlushbar(context, 'Reset link is sent to your mail');
                  });
                }
              },
              child: Text("Reset Password",
                  style: TextStyle(
                      fontFamily: 'Roboto', color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder authTfBorderOutline(bool focused) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(9.0),
      borderSide: BorderSide(
        color: focused ? Color(0xFF737373) : Color(0xFFB8B6B6),
        width: 1.125,
      ));
}
showFlushbar(BuildContext context, String message) {
  Flushbar(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(20),
    messageText: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    borderRadius: 10,
    backgroundColor: Colors.grey[800],
    duration: Duration(seconds: 3),
  )..show(context).whenComplete(() => Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) =>
              Login())));
}
