import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_era_kids/model/User.dart';
import 'package:flutter/material.dart';

class Student_Profile extends StatefulWidget {
  bool flag;
  Users user;
  Student_Profile({@required this.user, this.flag});

  @override
  _Student_ProfileState createState() => _Student_ProfileState(user: user);
}

class _Student_ProfileState extends State<Student_Profile> {
  Users user;
  _Student_ProfileState({this.user});

  @override
  void initState() {
    super.initState();
  }
  final _fire = FirebaseFirestore.instance;
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
      appBar: PreferredSize(
          child: Container(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              color: Color(0xffA9C938),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          color: Color(0xffffc809),
                          height: 32,
                          width: 32,
                          child: Icon(
                            Icons.account_circle_outlined,
                            size: 29,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(color: Colors.black, fontSize: 32),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          preferredSize: Size.fromHeight(100.0)),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              'CLASS: ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff585757),
                                fontWeight: FontWeight.w500,
                              ),
                            ),Text(
                              user.Class,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff585757),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              'GENDER: ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff585757),
                                fontWeight: FontWeight.w500,
                              ),
                            ),Text(
                              user.gender,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff585757),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.account_circle_outlined, size:100, color: Color(0xff0083fd))
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffEAF0D4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Details:',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Mobile No: ',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff585757),
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          user.phone_no.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff585757),
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Email ID: ',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff585757),
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          user.email,
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff585757),
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffEAF0D4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Details:',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Address: ',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff585757),
                              fontWeight: FontWeight.w500
                          ),
                        ),Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width *0.6,
                            child: Text(
                              user.address,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff585757),
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text(
                          'Age: ',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff585757),
                              fontWeight: FontWeight.w500
                          ),
                        ),Text(
                          user.age.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff585757),
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: 100,),
              widget.flag?
              TextButton(
                onPressed: (){
                  showDialog(
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.all(20),
                          actionsPadding: EdgeInsets.all(20),
                          title: Text("Do you really want to remove the student?"),
                          actions: [
                            Container(
                              width:
                              MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Color(0xff0083FD))),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("No",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff0083FD))),
                              ),
                            ),
                            Container(
                              width:
                              MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff0083fd)),
                              child: TextButton(
                                onPressed: () async {
                                  _fire.collection('users').doc(user.email).delete();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: Text("Yes",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white)),
                              ),
                            )
                          ],
                        );
                      },
                      context: context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delete, color: Colors.red,),
                  Text("Remove Student",style: TextStyle(color: Colors.red),)
                ],
              ),)
                  :Container()
            ],
          ),
        ),
      ),
    );
  }
}
