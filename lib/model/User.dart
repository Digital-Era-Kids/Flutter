import 'package:digital_era_kids/view/pages/students/student_profile.dart';
import 'package:flutter/material.dart';

class Users{
  Users(
      {this.name, this.age, this.gender, this.phone_no, this.email, this.Class, this.address, this.roleId, this.salary});

  final String name;
  final String age;
  final String gender;
  final String phone_no;
  final String email;
  final String Class;
  final String address;
  final int salary;
  final int roleId;
}