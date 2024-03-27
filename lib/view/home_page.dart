import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:project_samaya/view/utils/task/main_task_grid.dart';
import 'package:project_samaya/view/utils/task/subtask_tab.dart';

import 'add_new_task.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String todayDate = DateFormat.MMMEd().format(now);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 97, 238),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 78, 128, 255),
        onPressed: (() => Get.to(const AddNewTask())),
        child: const Icon(
          IconlyBold.paper_plus,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
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
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromARGB(255, 78, 128, 255)),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TaskGrid(),
            const SizedBox(
              height: 10,
            ),
            const TaskTabs(),
          ],
        ),
      ),
    );
  }
}
