import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUserController extends GetxController {
  var selected = "".obs.toString();
  List<String> dropDownItems = ["UI/UX", "Frontend", "Backend", "QA"];
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void setSelected(String value) {
    selected = value;
  }
}
