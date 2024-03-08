import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';

class UserRegistrationPage extends StatelessWidget {
  const UserRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var isPasswordHidden = true.obs;
    final userEmail = TextEditingController();
    final userPassword = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.35,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/loginSplash.png'),
                    fit: BoxFit.cover),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 45.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to ',
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                      Text(
                        'Taskify',
                        style: GoogleFonts.bebasNeue(
                            color: Colors.white, fontSize: 55),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Register a new Account',
                        style: GoogleFonts.ubuntu(
                            color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
              child: Column(
                children: [
                  //NAME FIELD
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Your Name',
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.shade300))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //EMAIL TEXTFIELD
                  TextField(
                    controller: userEmail,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.shade300))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  //PASSWORD TEXTFIELD
                  Obx(
                    () => TextField(
                      controller: userPassword,
                      obscureText: isPasswordHidden.value,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.password),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300)),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              isPasswordHidden.value = !isPasswordHidden.value;
                            },
                            child: isPasswordHidden.value
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //REGISTER BUTTON
                  GestureDetector(
                    onTap: () {
                      AuthController.instance.registerUser(
                        userEmail.text.trim(),
                        userPassword.text.trim(),
                      );
                    },
                    child: Container(
                      width: width * 0.8,
                      height: height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [Colors.blue.shade700, Colors.blue])),
                      child: Center(
                        child: Text(
                          'Register',
                          style: GoogleFonts.ubuntu(
                              fontSize: 22, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Already have an account ? ",
                          style: GoogleFonts.ubuntu(color: Colors.black),
                          children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.back(),
                            text: " Login",
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent))
                      ]))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
