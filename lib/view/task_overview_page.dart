import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class TaskOverviewPage extends StatelessWidget {
  const TaskOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            IconlyLight.arrow_left_2,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              child: const Icon(Icons.more_horiz, color: Colors.black),
              onTap: () {},
            ),
          )
        ],
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            Container(
              height: h * 0.38,
              width: w,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 18,
                  left: 13,
                  right: 13,
                  bottom: 15,
                ),
                child: Column(
                  children: [
                    Text(
                      'Add a New SubTask',
                      style: GoogleFonts.ubuntuCondensed(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Select Date',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w * 0.04,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Select Time',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: w * 0.4,
                        height: h * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              colors: [Colors.blue.shade600, Colors.blue],
                              begin: Alignment.topLeft,
                              end: Alignment.topRight),
                        ),
                        child: Center(
                          child: Text(
                            "add Subtask",
                            style: GoogleFonts.ubuntuCondensed(
                                fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 78, 128, 255),
        child: const Icon(IconlyLight.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: h * 0.35,
              width: w,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['title'].toString(),
                      style: GoogleFonts.ubuntu(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: h * 0.015,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 254, 216, 213),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            data['tag'].toString(),
                            style: GoogleFonts.ubuntu(
                              fontSize: 12,
                              color: const Color.fromARGB(255, 196, 48, 38),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    Text(
                      data['description'].toString(),
                      style: GoogleFonts.ubuntu(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: h * 0.035,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Due Date",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 15, color: Colors.grey.shade400),
                              ),
                              SizedBox(
                                height: h * 0.015,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    IconlyLight.calendar,
                                    color: Colors.grey.shade400,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: w * 0.015,
                                  ),
                                  Text(
                                    data['sDate'].toString(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Due date",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 15, color: Colors.grey.shade400),
                              ),
                              SizedBox(
                                height: h * 0.015,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    IconlyLight.time_circle,
                                    color: Colors.grey.shade400,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: w * 0.015,
                                  ),
                                  Text(
                                    data['sTime'].toString(),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
