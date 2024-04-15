import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_samaya/view/admin_department/screen/bottom_nav_bar.dart';
import 'package:project_samaya/widgets/admin_employee_nav.dart';
import '../view/admin_department/screen/admin_panel.dart';
import '../view/employee_department/bottom_nav_bar.dart';

class AuthController extends GetxController {
  //TO ACCESS THIS CONTROLLER FROM ANYWHERE
  static AuthController instance = Get.find();

  //FOR DEFINING THE USER MODEL FROM THE FIREBASE

  late Rx<User?> _admin;

  //FOR USING VARIOUS FIREBASE FUNCTIONS
  var auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();

    //TO ASSIGN THE CURRENT USER

    _admin = Rx<User?>(auth.currentUser);

    //TO CHECK THE STATUS OF THE USER

    _admin.bindStream(auth.userChanges());

    //EVER FUNCTION IS USED TO NOTIFY THE APP CORRESPONDING CHANGES FROM THE FIREBASE

    ever(_admin, _adminScreen);
  }

  // _initialScreen(User? user) {
  //   if (user == null) {
  //     Get.offAll(() => const AdminEmployeeSwitchScreen());
  //   } else {
  //     Get.offAll(() => const NavigationPage());
  //   }
  // }

  _adminScreen(User? admin) {
    if (admin == null) {
      Get.offAll(() => const AdminEmployeeSwitchScreen());
    } else {
      Get.offAll(() => const NavigationPage());
    }
  }

//   _initialScreen(User? user) {
//   if (user == null) {
//     Get.offAll(() => const AdminEmployeeSwitchScreen());
//   } else {
//     // Check if user is an admin
//     if (user.isAdmin) {
//       Get.offAll(() => const AdminHomePage());
//     } else {
//       Get.offAll(() => const NavigationPage());
//     }
//   }
// }

  //REGISTRATION FUNCTION   FOR EMPLOYEE
  Future<void> registerEmployee(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
      Get.snackbar(
        "Problem Occurred",
        "Alert",
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text("Account Creation Failed"),
        messageText: Text(e.toString()),
      );
    }
  }

//REGISTRATION FUNCTION FOR ADMIN
  Future<void> registerAdmin(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
      Get.snackbar(
        "Problem Occurred",
        "Alert",
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text("Account Creation Failed"),
        messageText: Text(e.toString()),
      );
    }
  }

  //LOGIN FUNCTION FOR EMPLOYEE
  void loginEmployee(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "Problem Occurred",
        "Alert",
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text("Login Failed"),
        messageText: Text(e.toString()),
      );
    }
  }

//LOGIN FUNCTION FOR ADMIN
  void loginAdmin(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "Problem Occurred",
        "Alert",
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text("Login Failed"),
        messageText: Text(e.toString()),
      );
    }
  }

  //SIGNOUT FUNCTION
  void logOutUser() async {
    await auth.signOut();
  }
}
