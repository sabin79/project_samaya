import 'package:flutter/material.dart';
import 'package:project_samaya/view/task_pages/all_task.dart';
import 'package:project_samaya/view/task_pages/completed.dart';
import 'package:project_samaya/view/task_pages/on_going_task.dart';

class TaskTabs extends StatefulWidget {
  const TaskTabs({super.key});

  @override
  State<TaskTabs> createState() => _TaskTabsState();
}

class _TaskTabsState extends State<TaskTabs> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Expanded(
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            indicatorColor: Colors.green,
            tabs: const [
              Tab(text: 'All task'),
              Tab(
                text: " going on",
              ),
              Tab(
                text: " completed",
              ),
            ],
          ),
          Expanded(
              child: TabBarView(controller: tabController, children: const [
            AllTasks(),
            OnGoingTask(),
            CompletedTasks()
          ]))
        ],
      ),
    );
  }
}
