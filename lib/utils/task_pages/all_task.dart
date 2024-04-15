import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_samaya/view/employee_department/screens/task/task_overview_page.dart';
import '../../view/admin_department/screen/task_detail/subtask_tile.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        // child: ListView(
        //   children: [
        //     TaskTile(
        //       taskName: 'Meeting about',
        //       endTime: DateTime(
        //         2024,
        //         7,
        //         23,
        //       ),
        //     ),
        //     TaskTile(
        //       taskName: 'Meeting with the client',
        //       endTime: DateTime(2023, 7, 23, 10, 00),
        //     ),
        //     TaskTile(
        //       taskName: 'Code the interface',
        //       endTime: DateTime(
        //         2023,
        //         7,
        //         23,
        //       ),
        //     ),
        //     //  TaskOverviewCard(),
        //   ],
        // ),
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
                    print(snapshot.data?.docs[index]);

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
                      child: TaskTile(
                        taskName: "${snapshot.data?.docs[index]['task']}",
                        endDate: DateTime(
                          2025,
                          7,
                          23,
                        ),
                        // endDate: snapshot.data?.docs[index]['enddate'],
                      ),
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
