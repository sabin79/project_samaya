import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:project_samaya/controller/register_controller.dart';
import 'package:project_samaya/model/firestore_data/user_model.dart';

import 'package:project_samaya/view/admin_department/user_authentication/user_login_page.dart';

class UserRegistrationPage extends StatefulWidget {
  const UserRegistrationPage({super.key});

  @override
  State<UserRegistrationPage> createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    final RegisterController registerController = Get.put(RegisterController());

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: registerController.formKey,
          child: Column(
            children: [
              Container(
                width: width,
                height: height * 0.35,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assects/login.png'),
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
                          'Samaya',
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 30.0),
                child: Obx(
                  () => Column(
                    children: [
                      //NAME FIELD
                      TextField(
                        controller: registerController.userName,
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
                      TextFormField(
                        controller: registerController.userEmail,
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
                      TextFormField(
                        controller: registerController.userPassword,
                        obscureText: registerController.isPasswordHidden.value,
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
                                registerController.isPasswordHidden.value =
                                    !registerController.isPasswordHidden.value;
                              },
                              child: registerController.isPasswordHidden.value
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      //PASSWORD TEXTFIELD
                      TextFormField(
                        controller: registerController.confirmUserPassword,
                        obscureText:
                            registerController.isConfirmPasswordHidden.value,
                        decoration: InputDecoration(
                            labelText: 'Confirm Password',
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
                                registerController
                                        .isConfirmPasswordHidden.value =
                                    !registerController
                                        .isConfirmPasswordHidden.value;
                              },
                              child: registerController
                                      .isConfirmPasswordHidden.value
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            )),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      //REGISTER BUTTON
                      GestureDetector(
                        //        if (!newTaskController.formkey.currentState!.validate()) {
                        //   return;
                        // }
                        // newTaskController.formkey.currentState!.save();
                        onTap: () {
                          if (!registerController.formKey.currentState!
                              .validate()) {
                            registerController.adduser(
                              registerController.userName.text,
                              registerController.userEmail.text,
                            );
                          }
                          registerController.formKey.currentState!.save();
                          // if (registerController.userPassword.text ==
                          //     registerController.confirmUserPassword.text) {
                          //   AuthController.instance.registerEmployee(
                          //     registerController.userEmail.text.trim(),
                          //     registerController.userPassword.text.trim(),
                          //   );
                          // } else {
                          //   Get.snackbar('Error', 'Password does not match',
                          //       snackPosition: SnackPosition.BOTTOM);
                          // }

                          final userdb = UserModel(
                              fullname: registerController.userName.text,
                              email: registerController.userEmail.text,
                              password: registerController.userPassword.text);
                          registerController.createUser(userdb);
                          print(userdb);
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
                                ..onTap =
                                    () => Get.off(() => const UserLoginPage()),
                              text: " Login",
                              style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
