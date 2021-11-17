import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_era_kids/model/User.dart';
import 'package:digital_era_kids/view/pages/students/add_student.dart';
import 'package:digital_era_kids/view/pages/students/student_profile.dart';
import 'package:flutter/material.dart';

import '../home.dart';

final _firestore = FirebaseFirestore.instance;

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
      body: WillPopScope(
        onWillPop: ()async{
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) =>
                      HomeScreen()));
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Container(
                //     height: 60,
                //     padding: EdgeInsets.symmetric(horizontal: 10),
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(30),
                //         border: Border.all(color: Colors.grey[300])),
                //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                //     child: TextButton(
                //         onPressed: () {},
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               'Search',
                //               style: TextStyle(color: Colors.grey[700]),
                //             ),
                //             Icon(Icons.search, color: Colors.grey[700])
                //           ],
                //         ))),
                SizedBox(
                  height: 20,
                ),
                StudentViewList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StudentViewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('users')
            .orderBy('name', descending: false)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final studentlist = snapshot.data.docs;
            List<Users> students = [];
            for (var studentView in studentlist) {
              final studentname = studentView.data()['name'];
              final studentGender = studentView.data()['gender'];
              final studentEmail = studentView.data()['email'];
              final studentNo = studentView.data()['phone'];
              final studentAge = (studentView.data()['age']);
              final studentClass = studentView.data()['class'];
              final studentAddress = studentView.data()['address'];
              final role_id=studentView.data()['role_id'];
              final studentContainer = Users(
                  name: studentname,
                  gender: studentGender,
                  age: studentAge,
                  email: studentEmail,
                  phone_no: studentNo,
                  Class: studentClass,
                  address: studentAddress,
              roleId: role_id);
              students.add(studentContainer);
            }
            List<Users> LKG_A =
                students.where((element) => element.Class == "LKG A"&&element.roleId==2).toList();
            List<Users> LKG_B =
                students.where((element) => element.Class == "LKG B"&&element.roleId==2).toList();
            List<Users> UKG_A =
                students.where((element) => element.Class == "UKG A"&&element.roleId==2).toList();
            List<Users> UKG_B =
                students.where((element) => element.Class == "UKG B"&&element.roleId==2).toList();
            return SingleChildScrollView(
              child: Column(
                children: [
                  ExpansionTile(
                    title: Text("LKG A",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                    children: [
                      LKG_A.length == 0
                          ? Container(margin: EdgeInsets.symmetric(vertical: 10),child: Text("No students in this class"))
                          : Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemCount: LKG_A.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                        tileColor: Color(0xffEAF0D4),
                                        leading: Icon(
                                            Icons.account_circle_outlined,
                                            size: 42,
                                            color: Color(0xff0083fd)),
                                        title: Text(LKG_A[index].name,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500)),
                                      trailing: Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey),
                                      onTap: (){
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(builder: (context) => Student_Profile(user: LKG_A[index],flag: true,)));
                                      },
                                    ),

                                  );
                                },
                              ),
                          )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ExpansionTile(
                    childrenPadding: EdgeInsets.symmetric(vertical: 10),
                    title: Text("LKG B",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                    children: [
                      LKG_B.length == 0
                          ? Container(margin: EdgeInsets.symmetric(vertical: 10),child: Text("No students in this class"))
                          : Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                            child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                                itemCount: LKG_B.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                        tileColor: Color(0xffEAF0D4),
                                        leading: Icon(
                                            Icons.account_circle_outlined,
                                            size: 42,
                                            color: Color(0xff0083fd)),
                                        title: Text(LKG_B[index].name,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500)),
                                      trailing: Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey),
                                      onTap: (){
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(builder: (context) => Student_Profile(user:LKG_B[index],flag: true,)));
                                      },
                                    ),
                                  );
                                },
                              ),
                          )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ExpansionTile(
                    title: Text("UKG A",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                    children: [
                      UKG_A.length == 0
                          ? Container(margin: EdgeInsets.symmetric(vertical: 10),child: Text("No students in this class"))
                          : Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                            child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                                itemCount: UKG_A.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                        tileColor: Color(0xffEAF0D4),
                                        leading: Icon(
                                            Icons.account_circle_outlined,
                                            size: 42,
                                            color: Color(0xff0083fd)),
                                        title: Text(UKG_A[index].name,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500)),
                                      trailing: Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey),
                                      onTap: (){
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(builder: (context) => Student_Profile(user:UKG_A[index], flag: true,)));
                                      },
                                    ),
                                  );
                                },
                              ),
                          )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ExpansionTile(
                    title: Text("UKG B",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                    children: [
                      UKG_B.length == 0
                          ? Container(margin: EdgeInsets.symmetric(vertical: 10),child: Text("No students in this class"))
                          : Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                            child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                                itemCount: UKG_B.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                        tileColor: Color(0xffEAF0D4),
                                        leading: Icon(
                                            Icons.account_circle_outlined,
                                            size: 42,
                                            color: Color(0xff0083fd)),
                                        title: Text(UKG_B[index].name,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500)),
                                      trailing: Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey),
                                      onTap: (){
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(builder: (context) => Student_Profile(user: UKG_B[index],flag: true,)));
                                      },
                                    ),
                                  );
                                },
                              ),
                          )
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: Color(0xFFA9C938),
            ));
          }
        });
  }
}
