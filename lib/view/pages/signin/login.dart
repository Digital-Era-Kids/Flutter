import 'package:digital_era_kids/view/pages/home.dart';
import 'package:digital_era_kids/view/pages/signin/forgotPassword.dart';
import 'package:digital_era_kids/view/pages/signin/signUp.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _secure;
  @override
  void initState() {
    _secure = false;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
            Container(
              margin: EdgeInsets.only(top: 30, right: 30, left: 30),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15),
                        child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return "Please enter email id";
                              } else if (EmailValidator.validate(value) ==
                                  false) {
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
                              labelStyle: TextStyle(
                                  color: Color(0xFFB8B6B6), fontSize: 12),
                              hintStyle: TextStyle(color: Color(0xFF737373)),
                              focusedBorder: authTfBorderOutline(true),
                              border: authTfBorderOutline(false),
                              enabledBorder: authTfBorderOutline(false),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                            obscureText: !_secure,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return "Please enter password";
                              } else if (value.trim().length < 8) {
                                return 'Must contain 8-30 characters';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            controller: password,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color(0xff2329D6),
                              ),
                              enabled: true,
                              hintText: "Enter password",
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  color: Color(0xFFB8B6B6), fontSize: 12),
                              hintStyle: TextStyle(color: Color(0xFF737373)),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _secure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color(0xFFB8B6B6),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _secure = !_secure;
                                  });
                                },
                              ),
                              focusedBorder: authTfBorderOutline(true),
                              border: authTfBorderOutline(false),
                              enabledBorder: authTfBorderOutline(false),
                            )),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: FlatButton(
                            child: Text("Forgot password?"),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                            },
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFA9C938),
                              ),
                              padding: EdgeInsets.all(2),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: FlatButton(
                                child: Text("Login",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                        fontSize: 16)),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                                },
                              ))),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[400],
                          ),
                          padding: EdgeInsets.all(2),
                          child: FlatButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Image(
                                  image: AssetImage('assets/images/google.png'),
                                  fit: BoxFit.cover,
                                  height: 30,
                                ),
                                Text("Sign in with Google",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.black,
                                        fontSize: 16))
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          child: const Text("Don't have an account? SignUp"),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUp()));
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
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
