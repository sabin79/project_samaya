import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:project_samaya/controller/auth_controller.dart';

import '../controller/new_task_controller.dart';
import 'home_page.dart';
import 'utils/input_field.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({
    super.key,
  });

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final formkey = GlobalKey<FormState>();
  final User user = FirebaseAuth.instance.currentUser!;
  // String taskname = '';
  // String tagname = '';
  // String enddateandtime = '';

  // String choosedateandtime = '';
  // String descriptionname = '';
  // String remindname = '';

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(user) async {
    if (isLoggedIn()) {
      FirebaseFirestore.instance
          .collection('TSamaya Users Details')
          .doc(user['uid'])
          .set(user)
          .catchError((e) {
        print(e);
      });
    } else {
      print('You need to be logged In');
    }
  }

  Future<void> _loadCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      user;
    });
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
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
    var newTaskController = Get.put(NewTaskController());
    //   String selectedRepeat = 'None';

    // int selectedRemind = 5;
    // List<int> remindList = [
    //   5,
    //   10,
    //   15,
    //   20,
    // ];
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
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Add New Task",
          style: GoogleFonts.ubuntu(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      InputField(
                          title: "Title",
                          controller: newTaskController.title,
                          hint: 'Enter a title here',
                          widget: const Text('')),
                      const SizedBox(
                        height: 0.015,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 3, left: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Tag",
                          style: GoogleFonts.ubuntu(
                              color: Colors.grey.shade500, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8),
                    child: DropdownButtonFormField(
                      onChanged: (newvalue) {
                        //  selectedRepeat = newvalue.toString();

                        newTaskController.setSelected(newvalue.toString());
                      },
                      items: dropDownItems.map((item) {
                        return DropdownMenuItem<String>(
                            value: item.toString(), child: Text(item));
                      }).toList(),
                      hint: Text(
                        "Choose Priority",
                        style: GoogleFonts.ubuntu(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 0.015,
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, top: 8.0, left: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "End date",
                                style: GoogleFonts.ubuntu(
                                    color: Colors.grey.shade500, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TextField(
                            controller: newTaskController.endTime,
                            decoration: InputDecoration(
                                focusColor:
                                    const Color.fromARGB(255, 78, 128, 255),
                                suffixIcon: const Icon(IconlyLight.time_circle),
                                hintText: "choose Date",
                                hintStyle: const TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade500))),
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
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
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, top: 8.0, left: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Choose Time",
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.grey.shade500,
                                      fontSize: 13)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: TextField(
                            controller: newTaskController.endTime,
                            decoration: InputDecoration(
                                focusColor:
                                    const Color.fromARGB(255, 78, 128, 255),
                                suffixIcon: const Icon(IconlyLight.time_circle),
                                hintText: "End Time",
                                hintStyle: const TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade500))),
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              newTaskController.chooseTime();
                            },
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Description',
                          style: GoogleFonts.ubuntu(
                              color: Colors.grey.shade500, fontSize: 13)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: newTaskController.description,
                      decoration: InputDecoration(
                          focusColor: const Color.fromARGB(255, 78, 128, 255),
                          hintText: 'Write Description here',
                          hintStyle: const TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500))),
                      maxLines: 7,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.015,
                  ),
                ],
              ),
              // Container(
              //   padding: const EdgeInsets.only(top: 20.0),
              //   child: DropdownButton(
              //     hint: const Text(
              //       'Please choose a Blood Group',
              //       style: TextStyle(
              //         color: Color.fromARGB(1000, 221, 46, 68),
              //       ),
              //     ),
              //     iconSize: 40.0,
              //     items: dropDownItems.map((val) {
              //       return DropdownMenuItem<String>(
              //         value: val,
              //         child: Text(val),
              //       );
              //     }).toList(),
              //     onChanged: (newValue) {
              //       setState(() {
              //         newTaskController.selected = newValue!;
              //         dropDownItems;
              //       });
              //     },
              //   ),
              // ),
              // InputField(
              //   title: "Remind",
              //   controller: TextEditingController(),
              //   hint: "$selectedRemind minutes early",
              //   widget: Row(
              //     children: [
              //       DropdownButton<String>(
              //           value: selectedRemind.toString(),
              //           icon: const Icon(
              //             Icons.keyboard_arrow_down,
              //             color: Colors.grey,
              //           ),
              //           iconSize: 32,
              //           elevation: 4,
              //           style: TextStyle(
              //               fontSize: 16,
              //               color: Get.isDarkMode
              //                   ? Colors.grey[400]
              //                   : Colors.grey[700]),
              //           underline: Container(height: 0),
              //           onChanged: (String? newValue) {
              //             setState(() {
              //               selectedRemind = int.parse(newValue!);
              //             });
              //           },
              //           items: remindList
              //               .map<DropdownMenuItem<String>>((int value) {
              //             return DropdownMenuItem<String>(
              //               value: value.toString(),
              //               child: Text(value.toString()),
              //             );
              //           }).toList()),
              //       const SizedBox(width: 6),
              //     ],
              //   ),
              // ),
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
                  if (!formkey.currentState!.validate()) return;
                  formkey.currentState!.save();
                  final Map<String, dynamic> samayaDetails = {
                    'uid': FirebaseAuth.instance.currentUser != null
                        ? FirebaseAuth.instance.currentUser!.uid
                        : '',
                    'task': newTaskController.title.text,
                    'tag': dropDownItems,
                    'end date': newTaskController.endDate.text,
                    'Choose time': newTaskController.endTime.text,
                    'Description': newTaskController.description.text,
                    'remind': newTaskController.repeat.text,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
