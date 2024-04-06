import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:project_samaya/controller/login_controller.dart';
import 'package:project_samaya/view/admin_department/screen/admin_panel.dart';
import '../../../controller/auth_controller.dart';
import 'user_register_page.dart';

class UserLoginPage extends StatelessWidget {
  const UserLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
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
                          'Sign in to your Account',
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
                child: Column(
                  children: [
                    //EMAIL TEXTFIELD
                    TextField(
                      controller: loginController.userEmail,
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
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),

                    //PASSWORD TEXTFIELD
                    TextField(
                      controller: loginController.userPassword,
                      obscureText: loginController.isPasswordHidden.value,
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
                            loginController.isPasswordHidden.value =
                                !loginController.isPasswordHidden.value;
                          },
                          child: loginController.isPasswordHidden.value
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: GoogleFonts.ubuntuMono(
                              color: Colors.blue.shade600,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    //LOGIN BUTTON
                    GestureDetector(
                      onTap: () {
                        AuthController.instance.loginEmployee(
                            loginController.userEmail.text.trim(),
                            loginController.userPassword.text.trim());
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
                            'Login',
                            style: GoogleFonts.ubuntu(
                                fontSize: 22, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(children: <Widget>[
                      const Expanded(
                          child: Divider(
                        thickness: 1.5,
                      )),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Or Continue With",
                        style: GoogleFonts.ubuntuCondensed(
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      const Expanded(
                          child: Divider(
                        thickness: 1.5,
                      )),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SvgPicture.asset(
                                //   'assets/google.svg',
                                //   height: height * 0.03,
                                // ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => const AdminHomePage());
                                  },
                                  child: Text(
                                    'Google',
                                    style: GoogleFonts.ubuntu(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Don't have an account? ",
                            style: GoogleFonts.ubuntu(color: Colors.black),
                            children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigate to registration page

                                  Get.off(const UserRegistrationPage());

                                  // Dispose the login controller
                                },
                              text: " Register",
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
      ),
    );
  }
}
