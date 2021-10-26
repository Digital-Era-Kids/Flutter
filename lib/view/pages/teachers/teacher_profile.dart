import 'package:digital_era_kids/model/User.dart';
import 'package:flutter/material.dart';

class TeacherProfile extends StatefulWidget {
  Users teacher;
  TeacherProfile({@required this.teacher});

  @override
  teacherProfileState createState() => teacherProfileState(teacher: teacher);
}

class teacherProfileState extends State<TeacherProfile> {
  Users teacher;
  teacherProfileState({this.teacher});

  @override
  void initState() {
    super.initState();
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
                          "Teacher Profile",
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      teacher.name,
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
                          'CLASS TEACHER: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff585757),
                            fontWeight: FontWeight.w500,
                          ),
                        ),Text(
                          teacher.Class,
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
                          teacher.gender,
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
                          teacher.phone_no,
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
                          teacher.email,
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
                              teacher.address,
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
                          teacher.age,
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff585757),
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text(
                          'Nationality: ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff585757),
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          'Indian',
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
            ],
          ),
        ),
      ),
    );
  }
}
