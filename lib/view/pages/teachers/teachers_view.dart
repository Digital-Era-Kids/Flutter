import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_era_kids/view/pages/students/student_profile.dart';
import 'package:digital_era_kids/view/pages/teachers/add_teacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
final _firestore=FirebaseFirestore.instance;

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
              TeachersList(),
            ],
          ),
        ),
      ),
    );
  }
}
class TeachersList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(stream:_firestore.collection('teacher_details').orderBy('name',descending: false).snapshots(),
      builder: (BuildContext context,AsyncSnapshot snapshot){
          final teacherlist=snapshot.data.docs;
          List<TeacherContainer> teacher=[];
          for(var teachers in teacherlist){
            final teachername=teachers.data()['name'];
            final teacherGender=teachers.data()['gender'];
            final teacherEmail=teachers.data()['email'];
            final teacherNo=teachers.data()['phone'];
            final teacherAge=teachers.data()['age'];
            final teacherContainer=  TeacherContainer(name: teachername,gender: teacherGender,
            age: teacherAge,email: teacherEmail,phone_no: teacherNo,);
            teacher.add(teacherContainer);
          }
          return Container(
            height: 400,
            width: 900,
            child: ListView(

              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              children: teacher,
            ),
          );
    });
  }

}
class TeacherContainer extends StatelessWidget {
  TeacherContainer({this.name,this.age,this.gender,this.phone_no,this.email});
  final String name;
  final String age;
  final String gender;
  final String phone_no;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FlatButton(

          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Student_Profile(name: name,age: age,email: email,)));
          },

          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xffEAF0D4),
              borderRadius: BorderRadius.circular(10),


            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$name',style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color:Colors.black,
                ),),
                Text('$age',style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff585757),
                ),),
                Text('$gender',style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff585757),
                ),),
                Text('$phone_no',style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff585757),
                ),),
                Text('$email',style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff585757),
                ),),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
