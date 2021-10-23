import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Student_Profile extends StatefulWidget {
  Student_Profile({this .name,this.age,this.email});
  final String email;
  final String name;
  final String age;

  @override
  _Student_ProfileState createState() => _Student_ProfileState();
}

class _Student_ProfileState extends State<Student_Profile> {
  String tname;
  String tage;
  String temail;
  @override
  void initState() {

    super.initState();
    getData(widget.email,widget.age,widget.name);
  }
  void getData(email,age,name){
    tname=name;
    tage=age;
    temail=email;
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
                          "Student Profile",
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
                    'KG-1',
                    style: TextStyle(fontSize: 16, color: Color(0xff585757)),
                  ),
                  Text(
                    'ROLL-NO: 1',
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
                  Text('Mobile No:',style: TextStyle(fontSize: 18,color: Color(0xff585757),),),
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
                  Text('Address:',style: TextStyle(fontSize: 18,color: Color(0xff585757),),),
                  Text('Age:$tage',style: TextStyle(fontSize: 18,color: Color(0xff585757),),),
                  Text('Nationality:',style: TextStyle(fontSize: 18,color: Color(0xff585757),),),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
