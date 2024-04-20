import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project_samaya/view/admin_department/screen/task_detail/subtask_tile.dart';

import '../../view/employee_department/screens/task/task_overview_page.dart';

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Samaya Task Details')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(const TaskOverviewPage(), arguments: {
                          "tags": "${snapshot.data?.docs[index]['tag']}",
                          "title": "${snapshot.data?.docs[index]['task']}",
                          "description":
                              "${snapshot.data?.docs[index]['Description']}",
                          "sDate": "${snapshot.data?.docs[index]['enddate']}",
                          "sTime":
                              "${snapshot.data?.docs[index]['Choosetime']}",
                        });
                      },
                      child: Builder(builder: (context) {
                        DateTime dateTime = DateTime(
                            int.parse(
                                "${snapshot.data?.docs[index]['enddate'].toString().split('/')[2]}"),
                            int.parse(
                                "${snapshot.data?.docs[index]['enddate'].toString().split('/')[1]}"),
                            int.parse(
                                "${snapshot.data?.docs[index]['enddate'].toString().split('/')[0]}"));
                        if (!DateTime.now().isAfter(dateTime)) {
                          return const SizedBox();
                        }
                        return TaskTile(
                          taskName: "${snapshot.data?.docs[index]['task']}",
                          endDate: dateTime,
                        );
                      }),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.hasData.toString()),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
