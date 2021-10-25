import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_era_kids/model/Student.dart';
import 'package:digital_era_kids/view/pages/students/add_student.dart';
import 'package:flutter/material.dart';

final _firestore=FirebaseFirestore.instance;

class StudentsView extends StatefulWidget {
  // const StudentsView({Key? key}) : super(key: key);

  @override
  _StudentsViewState createState() => _StudentsViewState();
}

class _StudentsViewState extends State<StudentsView> {
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
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Students View",
                      style: TextStyle(color: Colors.black, fontSize: 32),
                    )
                  ],
                ),
              )),
          preferredSize: Size.fromHeight(100.0)),
      floatingActionButton: FloatingActionButton(
        heroTag: "student",
        child: Icon(Icons.add),
        backgroundColor: Color(0xff377DFF),
        //tooltip: accessTypes["Create"].toString(),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Student_Create()));
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey[300])),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: TextButton(
                      onPressed: () {},
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
class StudentViewList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(stream:_firestore.collection('teacher_details').orderBy('name',descending: false).snapshots(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.hasData) {
            final studentlist = snapshot.data.docs;
            List<Student> students = [];
            for (var studentView in studentlist) {
              final studentname = studentView.data()['name'];
              final studentGender = studentView.data()['gender'];
              final studentEmail = studentView.data()['email'];
              final studentNo = studentView.data()['phone'];
              final studentAge = studentView.data()['age'];
              final studentClass = studentView.data()['class'];
              final studentAddress = studentView.data()['address'];
              final studentContainer = Student(
                  name: studentname,
                  gender: studentGender,
                  age: studentAge,
                  email: studentEmail,
                  phone_no: studentNo,
                  Class: studentClass,
                  address: studentAddress
              );
              students.add(studentContainer);
            }
            return Container(
              height: MediaQuery.of(context).size.height * 0.6,
              // margin: EdgeInsets.symmetric(vertical: 5,),
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      leading: Icon(Icons.person_outline, color: Colors.black,),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      tileColor: Color(0xffEAF0D4),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(students[index].name, style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 5,),
                          Text(
                            students[index].Class != null
                                ? students[index].Class
                                :  "-",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_sharp, color:Colors.grey),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TeacherProfile(teacher:teacher[index])));
                      },
                    ),
                  );
                },
              ),
            );
          }else{
            return Center(child: CircularProgressIndicator(color: Color(0xFFA9C938),));
          }
        });
  }

}