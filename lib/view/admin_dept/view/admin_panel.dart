import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_samaya/view/admin_department/screen/employee_detail_list/add_employee.dart';

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
                color: Colors.teal[200],
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
                                  Text(
                                    'Hello, Admin',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'Today is $todayDate',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ]),
                            SizedBox(
                              width: 50,
                            ),
                            Icon(Icons.notifications_sharp)
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(AddUser());
                              },
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.person,
                                  size: 45,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Text('Add User')
                          ],
                        ),
                        SizedBox(width: 45),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.add,
                                size: 45,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text('Add Project')
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
