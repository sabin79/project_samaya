import 'package:flutter/material.dart';
import 'package:project_samaya/view/utils/task/main_task_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../waveindicator.dart';

class TaskGrid extends StatefulWidget {
  const TaskGrid({super.key});

  @override
  State<TaskGrid> createState() => _TaskGridState();
}

class _TaskGridState extends State<TaskGrid> {
  List<Map<String, dynamic>> taskList = [];
  late Widget _child;

  @override
  void initState() {
    //  _child = const WaveIndicator();
    getDonors();
    super.initState();
  }

  Future<void> getDonors() async {
    await FirebaseFirestore.instance
        .collection('Blood Request Details')
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        for (int i = 0; i < querySnapshot.docs.length; ++i) {
          taskList.add(querySnapshot.docs[i].data());
        }
        print(taskList);
      }
    });
    setState(() {
      _child = mywidget();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _child = mywidget();
  }

  Widget mywidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 30,
        ),
        child: Row(
          children: [
            TaskCard(
                taskTag: "High Priority",
                taskTitle: " Mobile app",
                taskDescription:
                    "The karaoke mobile app is a delightful and user-friendly application that allows users to unleash their inner music star anytime, anywhere. With a vast library of songs spanning various genres and languages, users can easily search and choose their preferred tracks. The app's intuitive interface offers features like adjustable pitch and tempo, allowing users to personalize their singing experience. Users can also record their performances and share them with friends on social media platforms. The app incorporates a rating system, offering a fun way to compete with friends and receive feedback. Whether a seasoned performer or a shower-singer, this karaoke mobile app is designed to bring joy and entertainment to all music enthusiasts.",
                //percentage: 50,
                dueDate: "April 20 2024",
                startTime: "10:00 AM"),
            const SizedBox(
              width: 15,
            ),
            TaskCard(
                taskTag: "High Priority",
                taskTitle: "High Level Meeting",
                taskDescription:
                    "A day filled with high-level meetings is a whirlwind of intellectual exchange and strategic decision-making. The day starts with participants gathering in a well-appointed boardroom, ready to engage in discussions that shape the future of their organization. Eminent leaders and experts share their insights, backed by carefully prepared presentations and data-driven analyses. Focused conversations unravel, ideas clash, and consensus emerges. Each meeting is a platform to address critical challenges, make crucial decisions, and set ambitious goals. The day concludes with a sense of accomplishment, as minds converge and paths forward are charted. High-level meetings are a crucible of knowledge, collaboration, and progress.",
                // percentage: 20,
                dueDate: "August 20, 2023",
                startTime: "12:00 AM")
          ],
        ),
        // child: Row(
        //   children: [
        //     ListView.builder(
        //       itemCount: taskList.length,
        //       itemBuilder: (BuildContext context, index) {
        //         // return TaskCard(
        //         //   taskTag: taskList[index]["name"] ?? "",
        //         //   taskTitle: taskList[index]['taskTitle'],
        //         //   taskDescription: taskList[index]['taskDescription'],
        //         //   dueDate: taskList[index]['dueDate'],
        //         //   startTime: taskList[index]['startTime'],
        //         // );
        //         // return Text(taskList[index]["name"]);
        //       },
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
