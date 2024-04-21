import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_samaya/model/task_model.dart';

import 'package:project_samaya/view/admin_department/screen/task_detail/subtask_tile.dart';

import '../../view/employee_department/screens/task/task_overview_page.dart';

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime curentTime = DateTime.now();
    print('here');
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
                  snapshot.data?.docs.forEach((element) {
                    data.add(MainTaskModel(
                      ChooseTime: element['Choosetime'],
                      Description: element['Description'],
                      enddate: DateTime(
                        int.parse(element['enddate'].toString().split('/')[2]),
                        int.parse(element['enddate'].toString().split('/')[0]),
                        int.parse(element['enddate'].toString().split('/')[1]),
                      ),
                      employee: element.data()['employee'] == null
                          ? []
                          : List.from(
                              element['employee'].map((e) => e.toString())),
                      tag: List.from(element['tag'].map((e) => e.toString())),
                      task: element['task'],
                      uid: element['uid'],
                    ));
                  });
                  List<MainTaskModel> priorityData = [];

                  data.forEach((element) {
                    final date2 = DateTime.now();
                    final difference =
                        date2.difference(element.enddate!).inDays;
                    if ((difference * -1) < 0) {
                      priorityData.add(element);
                    }
                  });

                  priorityData.sort((a, b) => a.enddate!.compareTo(b.enddate!));

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: priorityData.length,
                      physics: ScrollPhysics(),
                      itemBuilder: (ctx, index) => GestureDetector(
                            onTap: () {
                              Get.to(TaskOverviewPage(), arguments: {
                                "tags": "${priorityData[index].tag}",
                                "title": "${priorityData[index].task}",
                                "description":
                                    "${priorityData[index].Description}",
                                "sDate": "${priorityData[index].enddate}",
                                "sTime": "${priorityData[index].ChooseTime}",
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: DateTime.now()
                                                .difference(priorityData[index]
                                                    .enddate!)
                                                .inDays *
                                            -1 >
                                        3
                                    ? Colors.white
                                    : Colors.red.shade100,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${priorityData[index].task}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${priorityData[index].Description}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        ('Due Date : ${DateFormat.yMMMEd().format(priorityData[index].enddate!)}'),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                          'Deadline ended : ${DateTime.now().difference(priorityData[index].enddate!).inDays * -1} days before')
                                    ],
                                  ),
                                ],
                              ),
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
  // Widget build(BuildContext context) {
  //   return
  //   Expanded(
  //     child: Container(
  //       color: Colors.white,
  //       child: StreamBuilder(
  //         stream: FirebaseFirestore.instance
  //             .collection('Samaya Task Details')
  //             .snapshots(),
  //         builder: (context, snapshot) {
  //           if (snapshot.connectionState == ConnectionState.active) {
  //             if (snapshot.hasData) {
  //               return ListView.builder(
  //                 itemCount: snapshot.data?.docs.length,
  //                 itemBuilder: (context, index) {
  //                   return GestureDetector(
  //                     onTap: () {
  //                       Get.to(const TaskOverviewPage(), arguments: {
  //                         "tags": "${snapshot.data?.docs[index]['tag']}",
  //                         "title": "${snapshot.data?.docs[index]['task']}",
  //                         "description":
  //                             "${snapshot.data?.docs[index]['Description']}",
  //                         "sDate": "${snapshot.data?.docs[index]['enddate']}",
  //                         "sTime":
  //                             "${snapshot.data?.docs[index]['Choosetime']}",
  //                       });
  //                     },
  //                     child: Builder(builder: (context) {
  //                       DateTime dateTime = DateTime(
  //                           int.parse(
  //                               "${snapshot.data?.docs[index]['enddate'].toString().split('/')[2]}"),
  //                           int.parse(
  //                               "${snapshot.data?.docs[index]['enddate'].toString().split('/')[1]}"),
  //                           int.parse(
  //                               "${snapshot.data?.docs[index]['enddate'].toString().split('/')[0]}"));
  //                       if (!DateTime.now().isAfter(dateTime)) {
  //                         return const SizedBox();
  //                       }
  //                       return TaskTile(
  //                         taskName: "${snapshot.data?.docs[index]['task']}",
  //                         endDate: dateTime,
  //                       );
  //                     }),
  //                   );
  //                 },
  //               );
  //             } else if (snapshot.hasError) {
  //               return Center(
  //                 child: Text(snapshot.hasData.toString()),
  //               );
  //             }
  //           } else {
  //             return const Center(
  //               child: CircularProgressIndicator(),
  //             );
  //           }
  //           return Container();
  //         },
  //       ),
  //     ),
  //   );
  // }
}
