import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_samaya/view/employee_department/authentication/login_as_employee.dart';

import 'admin_department/user_authentication/user_login_page.dart';

class AdminEmployeeSwitchScreen extends StatefulWidget {
  const AdminEmployeeSwitchScreen({super.key});

  @override
  State<AdminEmployeeSwitchScreen> createState() =>
      _AdminEmployeeSwitchScreenState();
}

class _AdminEmployeeSwitchScreenState extends State<AdminEmployeeSwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.green.withOpacity(0.7),
                Colors.blue.withOpacity(0.7),
                const Color(0xff2d59f4).withOpacity(0.8),
                Colors.purple.withOpacity(0.7),
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                "Samaya",
                style: TextStyle(
                    fontSize: 70,
                    fontStyle: FontStyle.normal,
                    color: Colors.purple.withOpacity(0.7),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                "Login as",
                style: TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.normal,
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(const UserLoginPage());
                },
                child: const Text("Admin", style: TextStyle(fontSize: 18)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Get.to(const EmployeeLoginPage());
                },
                child: const Text("Employee", style: TextStyle(fontSize: 18)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Text(
                "Never Leave 'till tomorrow \n which you can do today.",
                style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                    color: Colors.yellow.withOpacity(01),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
