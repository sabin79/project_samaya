import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_samaya/model/task_model.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final DateTime originalDateTime = DateTime.now();

  final DateTime manualDateTime = DateTime(2024, 3, 23);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Samaya Task Details')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<MainTaskModel> data = [];
                  snapshot.data?.docs.forEach(
                    (element) {
                      data.add(
                        MainTaskModel(
                          ChooseTime: element['Choosetime'],
                          Description: element['Description'],
                          enddate: DateTime(
                            int.parse(
                                element['enddate'].toString().split('/')[2]),
                            int.parse(
                                element['enddate'].toString().split('/')[0]),
                            int.parse(
                                element['enddate'].toString().split('/')[1]),
                          ),
                          employee: element.data()['employee'] == null
                              ? []
                              : List.from(
                                  element['employee'].map((e) => e.toString())),
                          tag: List.from(
                              element['tag'].map((e) => e.toString())),
                          task: element['task'],
                          uid: element['uid'],
                        ),
                      );
                    },
                  );
                  List<MainTaskModel> priorityData = [];

                  data.forEach(
                    (element) {
                      final date2 = DateTime.now();
                      final difference =
                          date2.difference(element.enddate!).inDays;
                      if ((difference * -1) < 100000000 &&
                          (difference * -1) > 0) {
                        priorityData.add(element);
                      }
                    },
                  );

                  priorityData.sort((a, b) => a.enddate!.compareTo(b.enddate!));

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: priorityData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) => Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    '${priorityData[index].task}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Text(
                                  '${priorityData[index].Description}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat.yMMMEd()
                                          .format(priorityData[index].enddate!),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                        'Due: ${DateTime.now().difference(priorityData[index].enddate!).inDays * -1}')
                                  ],
                                ),
                              ],
                            ),
                          ));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
