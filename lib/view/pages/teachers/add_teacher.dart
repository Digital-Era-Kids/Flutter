import 'package:digital_era_kids/model/teacher.dart';
import 'package:digital_era_kids/services/auth_services.dart';
import 'package:digital_era_kids/view/pages/teachers/teachers_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _fire = FirebaseFirestore.instance;

class Teacher_Create extends StatefulWidget {
  // const Teacher_Create({Key? key}) : super(key: key);

  @override
  _Teacher_CreateState createState() => _Teacher_CreateState();
}

class _Teacher_CreateState extends State<Teacher_Create> {
  final _formKey = GlobalKey<FormState>();
  // FirebaseAuth auth = FirebaseAuth.insta
  String name, phoneNo, salary, email, address, age;
  String gender, Class;
  authServices auth = new authServices();
  String validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PreferredSize(
        // preferredSize: Size.fromHeight(1),
        child: Container(
          height: 30,
          color: Color(0xffffc809),
        ),
      ),
      backgroundColor: Color(0xffF6F5F5),
      appBar: PreferredSize(
          child: Container(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              color: Color(0xffA9C938),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Color(0xffffc809),
                      height: 32,
                      width: 32,
                      child: Icon(
                        Icons.person_add_alt,
                        size: 29,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Add Teacher",
                      style: TextStyle(color: Colors.black, fontSize: 32),
                    )
                  ],
                ),
              )),
          preferredSize: Size.fromHeight(100.0)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18),
                        topLeft: Radius.circular(18))),
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Enter Details",
                        style: TextStyle(color: Colors.black26, fontSize: 22),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffEAF0D4),
                          enabled: true,
                          hintText: "Enter Name",
                          labelText: "Name",
                          labelStyle:
                              TextStyle(color: Color(0xFF737373), fontSize: 12),
                          hintStyle:
                              TextStyle(color: Color(0xFF737373), fontSize: 14),
                          focusedBorder: authTfBorderOutline(),
                          border: authTfBorderOutline(),
                          enabledBorder: authTfBorderOutline(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) => validateMobile(value),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffEAF0D4),
                                enabled: true,
                                hintText: "Enter Phone number",
                                labelText: "Phone",
                                labelStyle: TextStyle(
                                    color: Color(0xFF737373), fontSize: 12),
                                hintStyle: TextStyle(
                                    color: Color(0xFF737373), fontSize: 14),
                                focusedBorder: authTfBorderOutline(),
                                border: authTfBorderOutline(),
                                enabledBorder: authTfBorderOutline(),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  phoneNo = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffEAF0D4),
                                enabled: true,
                                hintText: "Enter Age",
                                labelText: "Age",
                                labelStyle: TextStyle(
                                    color: Color(0xFF737373), fontSize: 12),
                                hintStyle: TextStyle(
                                    color: Color(0xFF737373), fontSize: 14),
                                focusedBorder: authTfBorderOutline(),
                                border: authTfBorderOutline(),
                                enabledBorder: authTfBorderOutline(),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  age = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: Color(0xffEAF0D4),
                                borderRadius: BorderRadius.circular(10)),
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: Text(
                                  gender != null ? gender : 'Gender',
                                  style: TextStyle(
                                      color: Color(0xFF737373), fontSize: 12),
                                ),
                                items: <String>['Male', 'Female', 'Other']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    gender = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: Color(0xffEAF0D4),
                                borderRadius: BorderRadius.circular(10)),
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: Text(
                                  Class != null ? Class : 'Class',
                                  style: TextStyle(
                                      color: Color(0xFF737373), fontSize: 12),
                                ),
                                items: <String>[
                                  'LKG A',
                                  'LKG B',
                                  'UKG A',
                                  'UKG B'
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    Class = value;
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some value';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffEAF0D4),
                            enabled: true,
                            hintText: "Enter Salary",
                            labelText: "Salary",
                            labelStyle: TextStyle(
                                color: Color(0xFF737373), fontSize: 12),
                            hintStyle: TextStyle(
                                color: Color(0xFF737373), fontSize: 14),
                            focusedBorder: authTfBorderOutline(),
                            border: authTfBorderOutline(),
                            enabledBorder: authTfBorderOutline(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              salary = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffEAF0D4),
                            enabled: true,
                            hintText: "Enter Email",
                            labelText: "Email",
                            labelStyle: TextStyle(
                                color: Color(0xFF737373), fontSize: 12),
                            hintStyle: TextStyle(
                                color: Color(0xFF737373), fontSize: 14),
                            focusedBorder: authTfBorderOutline(),
                            border: authTfBorderOutline(),
                            enabledBorder: authTfBorderOutline(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 80,
                        child: TextFormField(
                          minLines: 1,
                          maxLines: 5,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return "Please enter address";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffEAF0D4),
                            enabled: true,
                            hintText: "Enter Address",
                            labelText: "Address",
                            labelStyle: TextStyle(
                                color: Color(0xFF737373), fontSize: 12),
                            hintStyle: TextStyle(
                                color: Color(0xFF737373), fontSize: 14),
                            focusedBorder: authTfBorderOutline(),
                            border: authTfBorderOutline(),
                            enabledBorder: authTfBorderOutline(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              address = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff0083FD))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff0083FD)),
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff0083FD)),
                    child: TextButton(
                        onPressed: () async {
                          String error;
                          if (_formKey.currentState.validate()) {
                            var user = FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: email, password: "abcde1234")
                                .catchError((onError) {
                                  if (onError.code == "email-already-in-use") {
                                    error = "error";
                                    showFlushbar(
                                        context, "Email already in use");
                                  }
                                })
                                .whenComplete(() => error == null
                                    ? _fire.collection('teacher_details').add(
                                        {
                                          'name': name,
                                          'age': age,
                                          'phone': phoneNo,
                                          'salary': salary,
                                          'class': Class,
                                          'gender': gender,
                                          'address': address,
                                          'email': email,
                                          'role_id': 1
                                        },
                                      )
                                    : null)
                                .whenComplete(() => error == null
                                    ? showFlushbar(
                                        context, "Teacher added successfully!!")
                                    : null);
                          }
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder authTfBorderOutline() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(9.0),
      borderSide: BorderSide(
        color: Color(0xffEAF0D4),
        width: 1.0,
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
  )..show(context).whenComplete(() => message == "Teacher added successfully!!"
      ? Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => TeachersView()))
      : null);
}
