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
                    Icons.home_outlined,
                    size: 29,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 20,),
                Text("Home",style: TextStyle(color: Colors.black,fontSize: 32),)
              ],
            ),
          )),
          preferredSize: Size.fromHeight(100.0)),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.1),
              child: SingleChildScrollView(
                  child: Column(
                children: [
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
                                Icons.account_circle_outlined,
                                size: 120,
                                color: Color(0xFF2564AE),
                              ),
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Teachers()));
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            child: Icon(
                              Icons.message_outlined,
                              size: 120,
                              color: Color(0xFF2564AE),
                            ),
                          ),
                          Text(
                            "Messages",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
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
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
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
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            child: Icon(
                              Icons.calendar_today_outlined,
                              size: 120,
                              color: Color(0xFF2564AE),
                            ),
                          ),
                          Text(
                            "Time Table",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            child: Icon(
                              Icons.power_settings_new,
                              size: 120,
                              color: Color(0xFF2564AE),
                            ),
                          ),
                          Text(
                            "Log out",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )),
            ),
            Container(
              color: Color(0xffffc809),
              width: MediaQuery.of(context).size.width,
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
