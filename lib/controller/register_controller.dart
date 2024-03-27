import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;
  final TextEditingController userEmail = TextEditingController();
  final TextEditingController userPassword = TextEditingController();
  final TextEditingController confirmUserPassword = TextEditingController();
  final TextEditingController userName = TextEditingController();
  late FirebaseAuth auth;
  final formkey = GlobalKey<FormState>();
}
