import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_samaya/utils/task_pages/all_task.dart';
import 'package:project_samaya/utils/task_pages/completed.dart';
import 'package:project_samaya/view/admin_department/screen/bottom_nav_bar.dart';

class TaskDetailPage extends StatefulWidget {
  const TaskDetailPage({super.key});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Project  Detail",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            indicatorColor: Colors.green,
            tabs: const [
              Tab(text: 'Prcessing'),
              Tab(
                text: " completed",
              ),
            ],
          ),
          Expanded(
              child: TabBarView(controller: tabController, children: const [
            ExpiredTasks(),
            CompletedTasks(),
          ]))
        ],
      ),
    );
  }
}
