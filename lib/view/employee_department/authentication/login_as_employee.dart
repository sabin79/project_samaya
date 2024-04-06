import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_samaya/controller/auth_controller.dart';
import 'package:project_samaya/view/employee_department/controller/employee_login_controller.dart';

class EmployeeLoginPage extends StatelessWidget {
  const EmployeeLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EmployeeLoginController employeeController =
        Get.put(EmployeeLoginController());
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
                          'Welcome Employee',
                          style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 27,
                          ),
                        ),
                        Center(
                          child: Text(
                            ' Samaya',
                            style: GoogleFonts.bebasNeue(
                                color: Colors.white, fontSize: 55),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
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
                    const SizedBox(
                      height: 50,
                    ),
                    //EMAIL TEXTFIELD
                    TextField(
                      controller: employeeController.userEmail,
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
                      controller: employeeController.userPassword,
                      obscureText: employeeController.isPasswordHidden.value,
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
                            employeeController.isPasswordHidden.value =
                                !employeeController.isPasswordHidden.value;
                          },
                          child: employeeController.isPasswordHidden.value
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
                            employeeController.userEmail.text.trim(),
                            employeeController.userPassword.text.trim());
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
