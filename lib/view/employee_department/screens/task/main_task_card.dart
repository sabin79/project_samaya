import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:project_samaya/view/employee_department/screens/task/task_overview_page.dart';

class TaskCard extends StatefulWidget {
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
      required this.dueDate,
      required this.startTime});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: (() => Get.to(const TaskOverviewPage(), arguments: {
            "tags": widget.taskTag,
            "title": widget.taskTitle,
            "description": widget.taskDescription,
            "sDate": widget.dueDate,
            "sTime": widget.startTime
          })),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          height: h * 0.37,
          width: w * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 18, top: 18, right: 18, bottom: 5),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 254, 216, 213),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    widget.taskTag,
                    style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 196, 48, 38),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.taskTitle,
                  style: GoogleFonts.ubuntu(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  widget.taskDescription,
                  style: GoogleFonts.ubuntu(color: Colors.grey, fontSize: 15),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 18,
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.calendar_view_month_rounded,
                      size: 16,
                    ),
                    const SizedBox(width: 15),
                    Text(widget.dueDate)
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Row(
                  children: [
                    const Icon(Icons.schedule, size: 16),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(widget.startTime),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
