import 'package:digital_era_kids/view/pages/teachers/add_teacher.dart';
import 'package:flutter/material.dart';

class Teachers extends StatefulWidget {
  // const Teachers({Key? key}) : super(key: key);

  @override
  _TeachersState createState() => _TeachersState();
}

class _TeachersState extends State<Teachers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  PreferredSize(
        // preferredSize: Size.fromHeight(1),
        child: Container(height:30,color: Color(0xffffc809),),
      ),
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
                        Icons.person_outline,
                        size: 29,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text("Teachers",style: TextStyle(color: Colors.black,fontSize: 32),)
                  ],
                ),
              )),
          preferredSize: Size.fromHeight(100.0)),
      floatingActionButton: FloatingActionButton(
        heroTag: "teacher",
        child: Icon(Icons.add),
        backgroundColor: Color(0xff377DFF),
        //tooltip: accessTypes["Create"].toString(),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Teacher_Create()));
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 60,
                padding:EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey[300])),
                margin:EdgeInsets.symmetric(horizontal: 20,vertical: 30) ,
                  child: TextButton(
                      onPressed: () {

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Search',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          Icon(Icons.search, color: Colors.grey[700])
                        ],
                      ))),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
