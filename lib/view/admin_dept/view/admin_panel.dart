import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_samaya/view/admin_dept/view/add_user.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String todayDate = DateFormat.MMMEd().format(now);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xff2d59f4).withOpacity(0.8),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 12, right: 35, left: 30.0),
                  child: Stack(children: [
                    Positioned(
                      top: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Hello, Admin',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Today is $todayDate',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 130,
                          ),
                          const CircleAvatar(
                            backgroundColor: Colors.white24,
                            radius: 20,
                            child: Icon(
                              Icons.notifications_sharp,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(AddUser());
                              },
                              child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.grey.withOpacity(0.7),
                                child: const Icon(
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
                            CircleAvatar(
                              radius: 55,
                              backgroundColor: Colors.grey.withOpacity(0.7),
                              child: const Icon(
                                Icons.add,
                                size: 45,
                                color: Colors.white,
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
            ),
            Expanded(
              child: Container(
                //height: 200,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
