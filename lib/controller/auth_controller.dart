import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_samaya/view/admin_department/screen/bottom_nav_bar.dart';
import 'package:project_samaya/widgets/admin_employee_nav.dart';
import '../view/employee_department/bottom_nav_bar.dart';

class AuthController extends GetxController {
  //TO ACCESS THIS CONTROLLER FROM ANYWHERE
  static AuthController instance = Get.find();

  //FOR DEFINING THE USER MODEL FROM THE FIREBASE

  late Rx<User?> _admin;

  //FOR USING VARIOUS FIREBASE FUNCTIONS
  var auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onReady() {
    super.onReady();

    //TO ASSIGN THE CURRENT USER

    _admin = Rx<User?>(auth.currentUser);

    //TO CHECK THE STATUS OF THE USER

    _admin.bindStream(auth.userChanges());

    //EVER FUNCTION IS USED TO NOTIFY THE APP CORRESPONDING CHANGES FROM THE FIREBASE

    // ever(_admin, _adminScreen);
    ever(_admin, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const AdminEmployeeSwitchScreen());
    } else {
      Get.offAll(() => const EmployeeNavBar());
    }
  }

  // _adminScreen(User? admin) async {
  //   bool is_admin = false;

  //   if (admin == null) {
  //     Get.offAll(() => const AdminEmployeeSwitchScreen());
  //   } else {
  //     DocumentSnapshot<Map<String, dynamic>> fdata =
  //         await firestore.collection('Admin Details').doc().get();
  //     fdata.data()?.forEach((key, value) {
  //       if (key == admin.uid) {
  //         is_admin = true;
  //       }
  //     });

  //     if (is_admin) {
  //       Get.offAll(() => const AdminNavBar());
  //     } else {
  //       Get.offAll(() => const EmployeeNavBar());
  //     }
  //   }
  // }

  _adminScreen(User? admin) async {
    try {
      bool is_admin = false;

      if (admin == null) {
        Get.offAll(() => const AdminEmployeeSwitchScreen());
      } else {
        DocumentSnapshot<Map<String, dynamic>> fdata =
            await firestore.collection('Admin Details').doc().get();

        // Print the fetched data for debugging
        print("Fetched Data: ${fdata.data()}");

        fdata.data()?.forEach((key, value) {
          if (key == admin.uid) {
            is_admin = true;
          }
        });

        if (is_admin) {
          Get.offAll(() => const AdminNavBar());
        } else {
          Get.offAll(() => const EmployeeNavBar());
        }
      }
    } catch (e) {
      print("Error fetching admin data: $e");
      Get.offAll(() => const AdminEmployeeSwitchScreen());
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
//       Get.offAll(() => const EmployeeNavBar());
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
