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
    //   String selectedRepeat = 'None';

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
                              Text("End date",
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.grey.shade500,
                                      fontSize: 13)),
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
                              newTaskController.chooseTime();
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
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8.0, top: 8.0, left: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Description',
                            style: GoogleFonts.ubuntu(
                                color: Colors.grey.shade500, fontSize: 13)),
                      ],
                    ),
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
                  // Button action
                },
                child: Text(
                  'Asign Task',
                  style: GoogleFonts.ubuntu(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
