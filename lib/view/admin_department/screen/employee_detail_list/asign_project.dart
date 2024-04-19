import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import 'package:project_samaya/view/admin_department/screen/bottom_nav_bar.dart';

import 'package:project_samaya/view/admin_department/screen/employee_detail_list/employee_detail.dart';

import '../../controller/new_task_controller.dart';

import '../../../../widgets/input_field.dart';

class AssignProjectPage extends StatefulWidget {
  const AssignProjectPage({
    super.key,
  });

  @override
  State<AssignProjectPage> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AssignProjectPage> {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(Map<String, dynamic> task) async {
    if (isLoggedIn()) {
      FirebaseFirestore.instance
          .collection('Samaya Task Details')
          .doc(task['uid']) // Assuming 'uid' is a field in userData
          .set(task)
          .catchError((e) {
        print(e);
      });
    } else {
      print('You need to be logged In');
    }
  }

  Future<void> dialogTrigger(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Task Added Successfully'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                //  formkey.currentState?.reset();
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavBarpage()));
              },
              child: const Icon(
                Icons.arrow_forward,
                color: Color.fromARGB(1000, 221, 46, 68),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final NewTaskController newTaskController = Get.put(NewTaskController());

    List<String> dropDownItems = ["High Priority", "Low Priority"];

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            IconlyLight.arrow_left_2,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 78, 128, 255),
        centerTitle: true,
        title: Text(
          "Asign Project",
          style: GoogleFonts.ubuntu(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: newTaskController.formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputField(
                      title: "Title",
                      controller: newTaskController.title,
                      hint: 'Enter a title here',
                      widget: const Text('')),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Project Details',
                    style: GoogleFonts.ubuntu(
                        color: Colors.grey.shade500, fontSize: 16),
                  ),
                  TextField(
                    controller: newTaskController.description,
                    decoration: InputDecoration(
                      focusColor: const Color.fromARGB(255, 78, 128, 255),
                      hintText: 'Write Description here',
                      hintStyle:
                          const TextStyle(fontSize: 16, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    maxLines: 4,
                  ),
                  SizedBox(
                    height: h * 0.015,
                  ),
                  Text(
                    "Task Type",
                    style: GoogleFonts.ubuntu(
                        color: Colors.grey.shade500, fontSize: 17),
                  ),
                  DropdownButtonFormField(
                    onChanged: (newvalue) {
                      //  selectedRepeat = newvalue.toString();

                      newTaskController.setSelected(newvalue.toString());
                    },
                    items: dropDownItems.map((priority) {
                      return DropdownMenuItem<String>(
                          value: priority.toString(), child: Text(priority));
                    }).toList(),
                    hint: Text(
                      "Choose type",
                      style: GoogleFonts.ubuntu(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Add team Members",
                    style: GoogleFonts.ubuntu(
                      color: Colors.grey.shade500,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const EmployeeDetailPage());
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 78, 128, 255),
                        borderRadius: BorderRadius.circular(12),
                        //border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Center(
                                child: Text(
                                  "End date",
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.grey.shade500,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: TextField(
                                controller: newTaskController.endDate,
                                decoration: InputDecoration(
                                    focusColor:
                                        const Color.fromARGB(255, 78, 128, 255),
                                    suffixIcon: const Icon(
                                      IconlyLight.calendar,
                                      color: Color.fromARGB(255, 78, 128, 255),
                                    ),
                                    hintText: "choose Date",
                                    hintStyle: const TextStyle(fontSize: 12),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade500))),
                                onTap: () async {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  newTaskController.chooseDate();
                                },
                              ),
                            ),
                            SizedBox(
                              height: h * 0.01,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: w * 0.05,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("Choose Time",
                                style: GoogleFonts.ubuntu(
                                    color: Colors.grey.shade500, fontSize: 16)),
                            TextField(
                              controller: newTaskController.endTime,
                              decoration: InputDecoration(
                                  focusColor:
                                      const Color.fromARGB(255, 78, 128, 255),
                                  suffixIcon: const Icon(
                                    IconlyLight.time_circle,
                                    color: Color.fromARGB(255, 78, 128, 255),
                                  ),
                                  hintText: "End Time",
                                  hintStyle: const TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade500))),
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                newTaskController.chooseTime();
                              },
                            ),
                            SizedBox(
                              height: h * 0.01,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h * 0.055,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(w * 0.8, h * 0.07),
                      backgroundColor: const Color.fromARGB(255, 78, 128, 255),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (!newTaskController.formkey.currentState!.validate()) {
                        return;
                      }
                      newTaskController.formkey.currentState!.save();
                      Get.to(const BottomNavBarpage());
                      final Map<String, dynamic> samayaDetails = {
                        'uid': FirebaseAuth.instance.currentUser != null
                            ? FirebaseAuth.instance.currentUser!.uid
                            : '',
                        'task': newTaskController.title.text,
                        'tag': newTaskController.selected,
                        'enddate': newTaskController.endDate.text,
                        'Choosetime': newTaskController.endTime.text,
                        'Description': newTaskController.description.text,
                      };
                      addData(samayaDetails).then((result) {
                        dialogTrigger(context);
                      }).catchError((e) {
                        print(e);
                      });
                    },
                    child: Text(
                      'Asign Task',
                      style: GoogleFonts.ubuntu(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
