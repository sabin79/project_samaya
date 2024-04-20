import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_samaya/utils/task_pages/all_task.dart';
import 'package:project_samaya/utils/task_pages/completed.dart';
import 'package:project_samaya/view/admin_department/screen/bottom_nav_bar.dart';

import 'tasklist.dart';

class EmployeeTab extends StatefulWidget {
  const EmployeeTab({super.key});

  @override
  State<EmployeeTab> createState() => _EmployeeTabState();
}

class _EmployeeTabState extends State<EmployeeTab>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Column(
      children: [
        TabBar(
          controller: tabController,
          indicatorColor: Colors.green,
          tabs: const [
            Tab(text: 'On going'),
            Tab(
              text: " completed",
            ),
          ],
        ),
        Expanded(
            child: TabBarView(controller: tabController, children: const [
          ExpiredTasks(),
          TaskListScreen(),
        ]))
      ],
    );
  }
}
