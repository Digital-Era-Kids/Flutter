import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
class Attendence extends StatefulWidget {


  @override
  _AttendenceState createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
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
                            Icons.fact_check_outlined,
                            size: 29,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Attendence",
                          style: TextStyle(color: Colors.black, fontSize: 32),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          preferredSize: Size.fromHeight(100.0)),
      body: Padding(
        padding: EdgeInsets.only(top: 50,left: 20,right: 20),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          height: 368,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffEAF0D4),
          ),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Classes:',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),


              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Present In:',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),


              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('75',style: TextStyle(
                    fontSize: 75,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text('%',style: TextStyle(
                     fontSize: 35,
                         fontWeight: FontWeight.bold
                  ),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
