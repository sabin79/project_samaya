import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  double percentage;
  String taskTag;
  String taskTitle;
  String taskDescription;
  String dueDate;
  String startTime;

  TaskCard(
      {super.key,
      required this.taskTag,
      required this.taskTitle,
      required this.taskDescription,
      required this.percentage,
      required this.dueDate,
      required this.startTime});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
