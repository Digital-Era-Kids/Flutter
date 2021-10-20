import 'package:digital_era_kids/view/pages/signin/login.dart';
import 'package:digital_era_kids/view/pages/teachers/teachers_view.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => Login()));
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1),
          child: SingleChildScrollView(
              child: Container(
            decoration: BoxDecoration(
                color: Color(0xffF6F5F5),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                    topLeft: Radius.circular(18)),
                border: Border.all(color: Colors.grey[300])),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Teachers()));
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            style: TextStyle(fontSize: 16, color: Colors.black),
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
                      onPressed: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            style: TextStyle(fontSize: 16, color: Colors.black),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
