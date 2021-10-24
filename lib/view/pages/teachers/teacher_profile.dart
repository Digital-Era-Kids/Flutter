import 'package:flutter/material.dart';
class TeacherProfile extends StatefulWidget {
  TeacherProfile({this .name,this.age,this.email,this.address,this.gender,this.Class,this.phoneno});
  final String email;
  final String name;
  final String age;
  final String address;
  final String gender;
  final String Class;
  final String phoneno;

  @override
  _TeacherProfileState createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  String tname;
  String tage;
  String temail;
  String tphone;
  String tgender;
  String tclass;
  String taddress;
  @override
  void initState() {

    super.initState();
    getData(widget.email,widget.age,widget.name,widget.address,widget.gender,widget.Class,widget.phoneno);
  }
  void getData(email,age,name,address,gender,Class,phoneno){
    tname=name;
    tage=age;
    temail=email;
    taddress=address;
    tgender=gender;
    tclass=Class;
    tphone=phoneno;
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$tname',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'CLASS TEACHER: $tclass',
                    style: TextStyle(fontSize: 16, color: Color(0xff585757)),
                  ),
                  Text(
                    'GENDER: $tgender',
                    style: TextStyle(fontSize: 16, color: Color(0xff585757)),
                  ),
                  // Text(
                  //   '',
                  //   style: TextStyle(fontSize: 16, color: Color(0xff585757)),
                  // ),
                ],
              ),
            ),
            SizedBox(
                height: 25
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffEAF0D4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact Details:',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  Text('Mobile No: $tphone',style: TextStyle(fontSize: 18,color: Color(0xff585757),),),
                  Text('Email ID:$temail',style: TextStyle(fontSize: 18,color: Color(0xff585757),),),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffEAF0D4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Personal Details:',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  Text('Address:$taddress',style: TextStyle(fontSize: 18,color: Color(0xff585757),),),
                  Text('Age:$tage',style: TextStyle(fontSize: 18,color: Color(0xff585757),),),
                  Text('Nationality:Indian',style: TextStyle(fontSize: 18,color: Color(0xff585757),),),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
