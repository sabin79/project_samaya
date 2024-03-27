import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future adduserDetails(
    String name,
    String email,
  ) async {
    await FirebaseFirestore.instance.collection('Users').add({
      'Name': name,
      'Email': email,
    });
  }
}
