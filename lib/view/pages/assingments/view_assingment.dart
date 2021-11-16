import 'package:flutter/material.dart';
import 'package:digital_era_kids/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digital_era_kids/model/User.dart';
import 'package:digital_era_kids/model/assignments.dart';
final _fire=FirebaseFirestore.instance;
class ViewAssignment extends StatefulWidget {
  // const ViewAssignment({Key? key}) : super(key: key);

  @override
  _ViewAssignmentState createState() => _ViewAssignmentState();
}

class _ViewAssignmentState extends State<ViewAssignment> {
  authServices authentication = authServices();
  String email;
  Users uu ;
  String classS;
  getEmail() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    setState(() {
      email = user.email;
    });
  }
  @override
  void initState() {
    getEmail();
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Color(0xffffc809),
                      height: 32,
                      width: 32,
                      child: Icon(
                        Icons.post_add_outlined,
                        size: 29,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Assignment",
                      style: TextStyle(color: Colors.black, fontSize: 32),
                    )
                  ],
                ),
              )),
          preferredSize: Size.fromHeight(100.0)),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: _fire.collection('users').snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if (snapshot.hasData){
                  final users = snapshot.data.docs;
                  List<Users> users1 = [];
                  for (var u in users) {
                    final _email = u.data()["email"];
                    final classg = u.data()["class"];
                    final userData = Users(
                      email: _email,
                      Class: classg,
                    );
                    users1.add(userData);
                  }
                  users1 = users1.where((element) => element.email.toLowerCase() == email.toLowerCase()).toList();
                  for(var u2 in users1){
                    uu = u2;
                  };
                  classS=uu.Class;
                  return Container();
                }
                else{
                  return Container();
                }
              }
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Assignment(
                    Class: classS,
                  )
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}
class Assignment extends StatelessWidget {
Assignment({this.Class});
final String Class;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _fire.collection('assignments').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.hasData){
            final assignmentlist = snapshot.data.docs;
            List<Assignments> assignment = [];
            for (var AssignmentView in assignmentlist){

              final assignmentName = AssignmentView.data()['assignment'];
              final assignmentDate = AssignmentView.data()['Date'];
              final Assignclass = AssignmentView.data()['class'];
              final assignmentContainer=Assignments(
                assignment: assignmentName,
                date: assignmentDate,
                Class: Assignclass,
              );
              assignment.add(assignmentContainer);
            }
            assignment=assignment.where((element) => element.Class==Class).toList();
            return Container(
              height: MediaQuery.of(context).size.height * 0.6,
              // margin: EdgeInsets.symmetric(vertical: 5,),
              child: ListView.builder(
                itemCount: assignment.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0)),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: ListTile(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),


                      tileColor: Color(0xffEAF0D4),
                      title: Text(
                        assignment[index].assignment,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        assignment[index].date,
                      ),

                    ),
                  );
                },
              ),
            );

          }
          else {
            return Center(
                child: Text(
                  'NO ASSIGNMENT ADDED YET',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 30
                  ),
                ));
          }
        }
    );
  }
}
