import 'package:flutter/material.dart';
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
                    padding:
                        const EdgeInsets.only(bottom: 8.0, top: 8, left: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Titile",
                          style: GoogleFonts.ubuntu(
                              color: Colors.grey.shade500, fontSize: 17),
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
                        hintStyle: const TextStyle(fontSize: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide:
                                BorderSide(color: Colors.grey.shade500))),
                  ),
                  const SizedBox(
                    height: 0.015,
                  ),
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
                              color: Colors.grey.shade500, fontSize: 17),
                        ),
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
                  const SizedBox(
                    height: 0.015,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
