import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_era_kids/view/pages/students/student_profile.dart';
import 'package:digital_era_kids/view/pages/teachers/add_teacher.dart';
import 'package:digital_era_kids/view/pages/teachers/teacher_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digital_era_kids/model/User.dart';

final _firestore = FirebaseFirestore.instance;

class TeachersView extends StatefulWidget {
  // const TeachersView({Key? key}) : super(key: key);

  @override
  _TeachersViewState createState() => _TeachersViewState();
}

class _TeachersViewState extends State<TeachersView> {
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
                      "TeachersView",
                      style: TextStyle(color: Colors.black, fontSize: 32),
                    )
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
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Teacher_Create()));
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Container(
              //   height: 60,
              //   padding:EdgeInsets.symmetric(horizontal: 10),
              //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
              //   border: Border.all(color: Colors.grey[300])),
              //   margin:EdgeInsets.symmetric(horizontal: 20,vertical: 30) ,
              //     child: TextButton(
              //         onPressed: () {
              //
              //         },
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
              TeachersViewList(),
            ],
          ),
        ),
      ),
    );
  }
}

class TeachersViewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final teacherlist = snapshot.data.docs;
            List<Users> teacher = [];
            for (var TeachersView in teacherlist) {
              final teachername = TeachersView.data()['name'];
              final teacherGender = TeachersView.data()['gender'];
              final teacherEmail = TeachersView.data()['email'];
              final teacherNo = TeachersView.data()['phone'];
              final teacherAge = TeachersView.data()['age'];
              final teacherClass = TeachersView.data()['class'];
              final teacherAddress = TeachersView.data()['address'];
              final roleId = TeachersView.data()["role_id"];
              final teacherContainer = Users(
                  name: teachername,
                  gender: teacherGender,
                  age: teacherAge,
                  email: teacherEmail,
                  phone_no: teacherNo,
                  Class: teacherClass,
                  address: teacherAddress,
                  roleId: roleId);
              teacher.add(teacherContainer);
            }
            teacher = teacher.where((element) => element.roleId == 1).toList();
            print("************");
            print(teacher);
            return Container(
              height: MediaQuery.of(context).size.height * 0.6,
              // margin: EdgeInsets.symmetric(vertical: 5,),
              child: ListView.builder(
                itemCount: teacher.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0)),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      leading: Icon(Icons.account_circle_outlined,
                          size: 42, color: Color(0xff0083fd)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      tileColor: Color(0xffEAF0D4),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            teacher[index].name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            teacher[index].Class != null
                                ? teacher[index].Class
                                : "-",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_sharp,
                          color: Colors.grey),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                TeacherProfile(teacher: teacher[index], flag: true,)));
                      },
                    ),
                  );
                },
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
