import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_samaya/view/admin_department/screen/employee_detail_list/add_employee.dart';

import 'employee_detail_list/asign_project.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String todayDate = DateFormat.MMMEd().format(now);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Admin Panel'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 78, 128, 255),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.5),
              radius: 20,
              child: const Icon(
                Icons.notifications_sharp,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 300,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 12, right: 35, left: 30.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Admin Details')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  'Welcome ${snapshot.data!.docs[0]['name']}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                );
                              }
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Today is $todayDate',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(const AddUser());
                          },
                          child: const CircleAvatar(
                            radius: 55,
                            backgroundColor: Color.fromARGB(255, 78, 128, 255),
                            child: Icon(
                              Icons.person,
                              size: 45,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text('Add User')
                      ],
                    ),
                    const SizedBox(width: 45),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Get.to(const AssignProjectPage()),
                          child: const CircleAvatar(
                            radius: 55,
                            backgroundColor: Color.fromARGB(255, 78, 128, 255),
                            child: Icon(
                              Icons.add,
                              size: 45,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text('Add Project')
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 78, 128, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              //height: 200,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
