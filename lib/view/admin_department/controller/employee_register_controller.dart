import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_samaya/controller/auth_controller.dart';
import 'package:project_samaya/controller/employee_model.dart';

import 'package:project_samaya/controller/user_repository.dart';

class EmployeeRegisterController extends GetxController {
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;
  final TextEditingController userEmail = TextEditingController();
  final TextEditingController userPassword = TextEditingController();
  final TextEditingController confirmUserPassword = TextEditingController();
  final TextEditingController userName = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late FirebaseAuth auth;

  List<String> selected = [];

  void setSelected(value) {
    selected = [value];
  }

  // Future adduserDetails(
  //   String name,
  //   String email,
  //   String password,
  //   List selected,
  // ) async {
  //   await FirebaseFirestore.instance.collection('Users').add({
  //     'Name': name,
  //     'Email': email,
  //     'Password': password,
  //     'Department': selected,
  //   });
  // }

  final EmpRo = Get.put(UserRepository());
  Future<void> createEmployee(EmployeeModel user) async {
    await EmpRo.createEmployee(user);
  }

  Future addUser(
    String name,
    String email,
  ) async {
    await AuthController.instance.registerEmployee(email, userPassword.text);
  }
}
