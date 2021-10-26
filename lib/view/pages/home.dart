import 'package:digital_era_kids/view/pages/students/student_view.dart';
import 'package:digital_era_kids/view/pages/teachers/teachers_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:digital_era_kids/services/auth_services.dart';
import 'package:digital_era_kids/view/pages/attendence/attendence.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_era_kids/model/User.dart';

final _firestore = FirebaseFirestore.instance;

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  authServices authentication = authServices();
  String email;
  Users uu ;
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
                            Icons.home_outlined,
                            size: 29,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(color: Colors.black, fontSize: 32),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: Color(0xFF2564AE),
                      ),
                      iconSize: 29,
                      onPressed: () {
                        showDialog(
                            builder: (BuildContext context) {
                              return AlertDialog(
                                contentPadding: EdgeInsets.all(20),
                                actionsPadding: EdgeInsets.all(20),
                                title: Text("Do you want to Log Out?"),
                                actions: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Color(0xff0083FD))),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xff0083FD))),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xff0083fd)),
                                    child: TextButton(
                                      onPressed: () {
                                        authentication.SignOut(context);
                                      },
                                      child: Text("Log Out",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white)),
                                    ),
                                  )
                                ],
                              );
                            },
                            context: context);
                      },
                    )
                  ],
                ),
              )),
          preferredSize: Size.fromHeight(100.0)),
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            heightFactor: 0.2,
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.05),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.9,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              decoration: BoxDecoration(
                  color: Color(0xffF6F5F5),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18),
                      topLeft: Radius.circular(18)),
                  border: Border.all(color: Colors.grey[300])),
              child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('users').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      final users = snapshot.data.docs;
                      List<Users> users1 = [];
                      for (var u in users) {
                        final _email = u.data()["email"];
                        final roleId = u.data()["role_id"];
                        final userData = Users(
                          email: _email,
                            roleId: roleId
                        );
                        users1.add(userData);
                      }
                      print(users1);
                      users1 = users1.where((element) => element.email.toLowerCase() == email.toLowerCase()).toList();
                      for(var u2 in users1){
                          uu = u2;
                      }
                      if (uu.roleId == 1)
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          child: Icon(
                                            Icons.account_circle_outlined,
                                            size: 120,
                                            color: Color(0xFF2564AE),
                                          ),
                                        ),
                                        Text(
                                          "Profile",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StudentsView()));
                                    },
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TeachersView()));
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          child: Icon(
                                            Icons.table_chart_outlined,
                                            size: 120,
                                            color: Color(0xFF2564AE),
                                          ),
                                        ),
                                        Text(
                                          "Add TimeTable",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Attendence()));
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          child: Icon(
                                            Icons.fact_check_outlined,
                                            size: 120,
                                            color: Color(0xFF2564AE),
                                          ),
                                        ),
                                        Text(
                                          "Mark Attendance",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          child: Icon(
                                            Icons.post_add_outlined,
                                            size: 120,
                                            color: Color(0xFF2564AE),
                                          ),
                                        ),
                                        Text(
                                          "Add Assignments",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      else if(uu.roleId == 2)
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          child: Icon(
                                            Icons.group,
                                            size: 120,
                                            color: Color(0xFF2564AE),
                                          ),
                                        ),
                                        Text(
                                          "Profile",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StudentsView()));
                                    },
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TeachersView()));
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          child: Icon(
                                            Icons.table_chart_outlined,
                                            size: 120,
                                            color: Color(0xFF2564AE),
                                          ),
                                        ),
                                        Text(
                                          "Time Table",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Attendence()));
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          child: Icon(
                                            Icons.fact_check_outlined,
                                            size: 120,
                                            color: Color(0xFF2564AE),
                                          ),
                                        ),
                                        Text(
                                          "Attendance",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          child: Icon(
                                            Icons.post_add_outlined,
                                            size: 120,
                                            color: Color(0xFF2564AE),
                                          ),
                                        ),
                                        Text(
                                          "Assignments",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      else
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          child: Icon(
                                            Icons.group,
                                            size: 120,
                                            color: Color(0xFF2564AE),
                                          ),
                                        ),
                                        Text(
                                          "Students",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StudentsView()));
                                    },
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TeachersView()));
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          child: Icon(
                                            Icons.person_outline,
                                            size: 120,
                                            color: Color(0xFF2564AE),
                                          ),
                                        ),
                                        Text(
                                          "Teachers",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Attendence()));
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          child: Icon(
                                            Icons.fact_check_outlined,
                                            size: 120,
                                            color: Color(0xFF2564AE),
                                          ),
                                        ),
                                        Text(
                                          "Attendance",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          child: Icon(
                                            Icons.post_add_outlined,
                                            size: 120,
                                            color: Color(0xFF2564AE),
                                          ),
                                        ),
                                        Text(
                                          "Assignments",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                    }
                    else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
// SingleChildScrollView(
// child: Column(
// children: [
// SizedBox(
// height: 10,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// TextButton(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Card(
// child: Icon(
// Icons.group,
// size: 120,
// color: Color(0xFF2564AE),
// ),
// ),
// Text(
// "Students",
// style:
// TextStyle(fontSize: 16, color: Colors.black),
// )
// ],
// ),
// onPressed: () {
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => StudentsView()));
// },
// ),
// SizedBox(
// width: 20,
// ),
// TextButton(
// onPressed: () {
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => TeachersView()));
// },
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Card(
// child: Icon(
// Icons.person_outline,
// size: 120,
// color: Color(0xFF2564AE),
// ),
// ),
// Text(
// "Teachers",
// style:
// TextStyle(fontSize: 16, color: Colors.black),
// )
// ],
// ),
// )
// ],
// ),
// SizedBox(
// height: 10,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// TextButton(
// onPressed: () {
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => Attendence()));
// },
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Card(
// child: Icon(
// Icons.fact_check_outlined,
// size: 120,
// color: Color(0xFF2564AE),
// ),
// ),
// Text(
// "Attendance",
// style:
// TextStyle(fontSize: 16, color: Colors.black),
// )
// ],
// ),
// ),
// SizedBox(
// width: 30,
// ),
// TextButton(
// onPressed: () {},
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Card(
// child: Icon(
// Icons.post_add_outlined,
// size: 120,
// color: Color(0xFF2564AE),
// ),
// ),
// Text(
// "Assignments",
// style:
// TextStyle(fontSize: 16, color: Colors.black),
// )
// ],
// ),
// )
// ],
// ),
// ],
// ),
// )
