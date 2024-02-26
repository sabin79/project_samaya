import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../controller/new_task_controller.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({super.key});

  @override
  Widget build(BuildContext context) {
    var newTaskController = Get.put(NewTaskController());
    final dropDownItems = ["High Priority", "Medium Priority", "Low Priority"];

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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 8, left: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Titile",
                          style: GoogleFonts.ubuntu(
                              color: Colors.grey.shade500, fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  TextField(
                    controller: newTaskController.title,
                    decoration: InputDecoration(
                        focusColor: const Color.fromARGB(255, 78, 128, 255),
                        suffixIcon: const Icon(IconlyLight.edit),
                        hintText: "Title",
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.shade500))),
                  ),
                  SizedBox(
                    height: h * 0.015,
                  )
                ],
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
                              color: Colors.grey.shade500, fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  DropdownButtonFormField(
                    items: dropDownItems
                        .map((e) => DropdownMenuItem(child: Text(e)))
                        .toList(),
                    hint: Text(
                      "Choose Priority",
                      style: GoogleFonts.ubuntu(),
                    ),
                    onChanged: (newvalue) {
                      newTaskController.setSelected(newvalue.toString());
                    },
                  ),
                  SizedBox(
                    height: h * 0.015,
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 8, bottom: 8, left: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "End Date",
                                style: GoogleFonts.ubuntu(
                                    color: Colors.grey.shade500, fontSize: 13),
                              )
                            ],
                          ),
                        ),
                        TextField(
                          controller: newTaskController.endDate,
                          decoration: InputDecoration(
                              focusColor:
                                  const Color.fromARGB(255, 78, 128, 255),
                              hintText: "Choose Date",
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade500))),
                          onTap: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            newTaskController.chooseDate();
                          },
                        ),
                        SizedBox(
                          height: h * 0.015,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8, top: 8, left: 3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Choose Time",
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.grey.shade500,
                                        fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            TextField(
                              controller: newTaskController.endTime,
                              decoration: InputDecoration(
                                focusColor:
                                    const Color.fromARGB(255, 78, 128, 255),
                                suffixIcon: const Icon(IconlyLight.time_circle),
                                hintText: " End Time",
                                hintStyle: const TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade500)),
                              ),
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                newTaskController.chooseTime();
                              },
                            ),
                            const SizedBox(
                              height: 0.01,
                            ),
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: GoogleFonts.ubuntu(
                              color: Colors.grey.shade500, fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  TextField(
                    controller: newTaskController.description,
                    decoration: InputDecoration(
                        focusColor: const Color.fromARGB(255, 78, 128, 255),
                        hintText: 'Write Description here',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.shade500))),
                    maxLines: 7,
                  ),
                  SizedBox(
                    height: h * 0.015,
                  )
                ],
              ),
              SizedBox(
                height: h * 0.055,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Add Task",
                    style: GoogleFonts.ubuntu(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

// class NewTaskTextField extends StatelessWidget {
//   String title;
//   Icon? suffixIcon;
//   String hintTitle;
//   int maxLines;

//   NewTaskTextField(
//       {super.key,
//       required this.title,
//       required this.suffixIcon,
//       required this.hintTitle,
//       required this.maxLines});

//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;

//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, left: 3),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(title,
//                   style: GoogleFonts.ubuntu(
//                       color: Colors.grey.shade500, fontSize: 13)),
//             ],
//           ),
//         ),
//         TextField(
//           decoration: InputDecoration(
//               focusColor: const Color.fromARGB(255, 78, 128, 255),
//               suffixIcon: suffixIcon,
//               hintText: hintTitle,
//               hintStyle: const TextStyle(fontSize: 12),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide(color: Colors.grey.shade500))),
//           maxLines: maxLines,
//         ),
//         SizedBox(
//           height: h * 0.015,
//         ),
//       ],
//     );
//   }
// }
