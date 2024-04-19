import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:project_samaya/view/admin_department/controller/add_user-controller.dart';
import 'package:project_samaya/view/admin_department/controller/employee_register_controller.dart';
import 'package:project_samaya/view/admin_department/screen/admin_panel.dart';

import 'package:project_samaya/widgets/input_field.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(Map<String, dynamic> employee) async {
    if (isLoggedIn()) {
      FirebaseFirestore.instance
          .collection('Employee Details')
          .doc(employee['uid']) // Assuming 'uid' is a field in userData
          .set(employee)
          .catchError((e) {
        print(e);
      });
    } else {
      print('You need to be logged In');
    }
  }

  final AddUserController controller = Get.put(AddUserController());
  List<String> dropDownItems = ["UI/UX", "Frontend", "Backend", "QA"];

  @override
  Widget build(BuildContext context) {
    final EmployeeRegisterController employeeController =
        Get.put(EmployeeRegisterController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: employeeController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputField(
                      title: 'Name',
                      controller: employeeController.userName,
                      hint: 'Employee Name',
                      widget: const Text(''),
                    ),
                    InputField(
                      title: 'Email',
                      controller: employeeController.userEmail,
                      hint: 'Employee@gmail.com',
                      widget: const Text(''),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black54),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: TextFormField(
                        controller: employeeController.userPassword,
                        obscureText: employeeController.isPasswordHidden.value,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                color: Get.isDarkMode
                                    ? Colors.grey[300]
                                    : Colors.grey[500]),
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
                                      !employeeController
                                          .isPasswordHidden.value;
                                },
                                child: employeeController.isPasswordHidden.value
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        " Confirm Password",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black54),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: TextFormField(
                        controller: employeeController.confirmUserPassword,
                        obscureText:
                            employeeController.isConfirmPasswordHidden.value,
                        decoration: InputDecoration(
                            hintText: 'Confirm Password',
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
                                  employeeController
                                          .isConfirmPasswordHidden.value =
                                      !employeeController
                                          .isConfirmPasswordHidden.value;
                                },
                                child: employeeController
                                        .isConfirmPasswordHidden.value
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Department',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 12,
                ),
                // DropdownButtonFormField(
                //   decoration: InputDecoration(
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                //   onChanged: (newvalue) {
                //     employeeController.setSelected(newvalue.toString());
                //   },
                //   items: dropDownItems.map((listitem) {
                //     return DropdownMenuItem<String>(
                //       value: listitem.toString(),
                //       child: Text(listitem),
                //     );
                //   }).toList(),
                // ),

                DropdownButtonFormField(
                  onChanged: (newvalue) {
                    //  selectedRepeat = newvalue.toString();

                    employeeController.setSelected(newvalue.toString());
                  },
                  items: dropDownItems.map((priority) {
                    return DropdownMenuItem<String>(
                        value: priority.toString(), child: Text(priority));
                  }).toList(),
                  hint: Text(
                    "Department",
                    style: GoogleFonts.ubuntu(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (!employeeController.formKey.currentState!
                              .validate()) {
                            return;
                          } else {
                            employeeController.addUser(
                              employeeController.userName.text,
                              employeeController.userEmail.text,
                            );
                          }
                          employeeController.formKey.currentState!.save();

                          Get.to(const AdminHomePage());
                          final Map<String, dynamic> EmployeeDetails = {
                            'uid': FirebaseAuth.instance.currentUser != null
                                ? FirebaseAuth.instance.currentUser!.uid
                                : '',
                            'name': employeeController.userName.text,
                            'department': employeeController.selected,
                            'email': employeeController.userEmail.text,
                            'password': employeeController.userPassword.text
                          };
                          addData(EmployeeDetails)
                              .then((result) {})
                              .catchError((e) {
                            print(e);
                          });

                          // final employeedb = EmployeeModel(
                          //   fullname: employeeController.userName.text,
                          //   email: employeeController.userEmail.text,
                          //   password: employeeController.userPassword.text,
                          //   department: employeeController.selected,
                          // );
                          // employeeController.createEmployee(employeedb);
                        },
                        child: const Text('Add User')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
