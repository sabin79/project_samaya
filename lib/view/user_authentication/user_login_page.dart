import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';
import 'user_register_page.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key});

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();
  var isPasswordHidden = true.obs;
  late FirebaseAuth auth;
  final _formkey = GlobalKey<FormState>();

  bool validate_save() {
    final form = _formkey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.35,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assects/login.png'), fit: BoxFit.cover),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
              child: Column(
                children: [
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
                          borderSide: BorderSide(color: Colors.grey.shade300)),
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
                        ),
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
                      AuthController.instance.loginUser(
                          userEmail.text.trim(), userPassword.text.trim());
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
                              SvgPicture.asset(
                                'assets/google.svg',
                                height: height * 0.03,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                'Google',
                                style: GoogleFonts.ubuntu(),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       border: Border.all(color: Colors.grey.shade300)),
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //         vertical: 15.0, horizontal: 20.0),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         SvgPicture.asset(
                      //           'assets/images/facebook.svg',
                      //           height: height * 0.03,
                      //         ),
                      //         const SizedBox(
                      //           width: 8.0,
                      //         ),
                      //         Text(
                      //           'Facebook',
                      //           style: GoogleFonts.ubuntu(),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
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
                              ..onTap =
                                  () => Get.to(const UserRegistrationPage()),
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
    );
  }
}
