import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController userEmail = TextEditingController();
  final TextEditingController userPassword = TextEditingController();
  var isPasswordHidden = true.obs;
  late FirebaseAuth auth;
  final _formkey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    auth = FirebaseAuth.instance;
  }

  @override
  void onClose() {
    super.onClose();
    userEmail.dispose();
    userPassword.dispose();
  }

  bool validateSave() {
    final form = _formkey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
