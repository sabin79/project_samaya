import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:project_samaya/utils/task_pages/all_task.dart';
import 'package:project_samaya/view/admin_department/screen/task_detail/subtask_tab.dart';
import 'package:project_samaya/view/employee_department/model/employee_tab.dart';

import 'package:project_samaya/view/employee_department/model/tasklist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String todayDate = DateFormat.MMMEd().format(now);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Employee Panel",
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 42, 97, 238),
      ),
      // backgroundColor: const Color.fromARGB(255, 42, 97, 238),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color.fromARGB(255, 78, 128, 255),
      //   onPressed: (() => Get.to(const AddNewTask())),
      //   child: const Icon(
      //     IconlyBold.paper_plus,zxcvbnm
      //     color: Colors.white,
      //     size: 35,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " Hello",
                        style: TextStyle(
                            color: Colors.blue.shade100, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "today is $todayDate",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //   EmployeeTab(),
            const TaskListScreen(),
            // const TaskGrid(),
            const SizedBox(
              height: 10,
            ),
            //   const TaskDetailPage(),
            //  const ExpiredTasks(),
          ],
        ),
      ),
    );
  }
}
