import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_samaya/controller/auth_controller.dart';
import 'package:project_samaya/controller/user_model.dart';
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

  Future adduserDetails(
    String name,
    String email,
  ) async {
    await FirebaseFirestore.instance.collection('Users').add({
      'Name': name,
      'Email': email,
    });
  }

  final userRo = Get.put(UserRepository());
  Future<void> createUser(UserModel user) async {
    await userRo.createUser(user);
  }

  Future adduser(
    String name,
    String email,
  ) async {
    await AuthController.instance.registerEmployee(email, userPassword.text);
  }
}
