import 'package:flutter/material.dart';
import 'package:digital_era_kids/view/pages/teachers/teachers_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final _firestore=FirebaseFirestore.instance;
class Salary_Details extends StatefulWidget {
  // const Salary_Details({Key? key}) : super(key: key);

  @override
  _Salary_DetailsState createState() => _Salary_DetailsState();
}

class _Salary_DetailsState extends State<Salary_Details> {

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
      appBar:PreferredSize(
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
                            Icons.account_circle_outlined,
                            size: 29,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Salary Details",
                          style: TextStyle(color: Colors.black, fontSize: 32),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          preferredSize: Size.fromHeight(100.0)),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: SalaryList(),
      ),
    );
  }
}
class SalaryList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(stream:_firestore.collection('teacher_details').orderBy('name',descending: false).snapshots(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          final teacherlist=snapshot.data.docs;
          List<SalaryContainer> teacher=[];
          for(var teachers in teacherlist){
            final teachername=teachers.data()['name'];
            final teacherSalary=teachers.data()['salary'];
            final salaryContainer=  SalaryContainer(name: teachername,salary: teacherSalary,);
            teacher.add(salaryContainer);
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
class SalaryContainer extends StatefulWidget {

  SalaryContainer({this.name,this.salary,});
  final String name;
  final String salary;

  @override
  _SalaryContainerState createState() => _SalaryContainerState();
}

class _SalaryContainerState extends State<SalaryContainer> {
  String cname;
  String csalary;
  String paid='';
  @override
  void initState() {

    super.initState();
    getData(widget.name,widget.salary);
  }
  getData(name,salary){
    cname=name;
    csalary=salary;
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xffEAF0D4),
              borderRadius: BorderRadius.circular(10),


            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$cname',style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color:Colors.black,
                    ),),
                    Text('Salary:$csalary',style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff585757),
                    ),),
                    Text('Status:$paid',style: TextStyle(
                        fontSize: 16,
                        color:Color(0xff585757)
                    ),)

                  ],
                ),
                IconButton(onPressed: (){

                  showDialog(
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.all(20),
                          actionsPadding: EdgeInsets.all(20),
                          title: Text("Update Status?"),
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
                                  setState(() {
                                    paid='';
                                  });
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


                                  setState(() {
                                    paid='paid';
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text("Paid",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white)),
                              ),
                            )
                          ],
                        );
                      },
                      context: context);
                }, icon: Icon(Icons.edit,color: Colors.blue,),)
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}





