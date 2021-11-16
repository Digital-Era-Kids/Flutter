import 'package:digital_era_kids/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:digital_era_kids/model/User.dart';
final _fire = FirebaseFirestore.instance;
class AddAssingment extends StatefulWidget {


  @override
  _AddAssingmentState createState() => _AddAssingmentState();
}

class _AddAssingmentState extends State<AddAssingment> {
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
  final textContorller1=TextEditingController();
  final textContorller2=TextEditingController();
  String assingment;
  String date;
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
                      "Add Assignments",
                      style: TextStyle(color: Colors.black, fontSize: 32),
                    )
                  ],
                ),
              )),
          preferredSize: Size.fromHeight(100.0)),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
          child: Column(
            children: [
              TextFormField(

                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEAF0D4),
                  enabled: true,
                  hintText: " ASSIGNMENT",
                  labelText: "Add Assignment",
                  labelStyle:
                  TextStyle(color: Color(0xFF737373), fontSize: 12),
                  hintStyle:
                  TextStyle(color: Color(0xFF737373), fontSize: 14),


                ),
                controller: textContorller1,
                onChanged: (value) {
                  setState(() {
                    assingment = value;
                  });
                }
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(

                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEAF0D4),
                  enabled: true,
                  hintText: "DD/MM/YYYY",
                  labelText: "Add Due Date",
                  labelStyle:
                  TextStyle(color: Color(0xFF737373), fontSize: 12),
                  hintStyle:
                  TextStyle(color: Color(0xFF737373), fontSize: 14),

                ),
                  controller: textContorller2,
                  onChanged: (value) {
                    setState(() {
                      date = value;
                    });
                  }
              ),
              SizedBox(
                height: 20,
              ),
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
                    return Container();
                  }
                  else{
                    return Container();
                  }
                }
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff0083FD)),
                child: TextButton(onPressed: ()async{
                    textContorller2.clear();
                    textContorller1.clear();
                   _fire.collection('assignments').add({
                    'assignment':assingment,
                    'Date':date,
                     'class':uu.Class,
                  },);
                   showFlushbar(context, "Assignment Added Successfully");
                },
                    child: Text(
                      "Add",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),


                ),

              )


            ],
          ),
        ),
      )
    );
  }
}
