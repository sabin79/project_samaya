import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/bottom_nav_bar.dart';
import '../view/user_authentication/user_login_page.dart';

class AuthController extends GetxController {
  //TO ACCESS THIS CONTROLLER FROM ANYWHERE
  static AuthController instance = Get.find();

  //FOR DEFINING THE USER MODEL FROM THE FIREBASE
  late Rx<User?> _user;

  //FOR USING VARIOUS FIREBASE FUNCTIONS
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();

    //TO ASSIGN THE CURRENT USER
    _user = Rx<User?>(auth.currentUser);

    //TO CHECK THE STATUS OF THE USER
    _user.bindStream(auth.userChanges());

    //EVER FUNCTION IS USED TO NOTIFY THE APP CORRESPONDING CHANGES FROM THE FIREBASE
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => UserLoginPage());
    } else {
      Get.offAll(() => const NavigationPage());
    }
  }

  //REGISTRATION FUNCTION
  void registerUser(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //  Get.offAll(() => const HomePage());
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

  //LOGIN FUNCTION
  void loginUser(String email, password) async {
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
