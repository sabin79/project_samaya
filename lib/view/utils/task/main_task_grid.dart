import 'package:flutter/material.dart';
import 'package:project_samaya/view/utils/task/main_task_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskGrid extends StatefulWidget {
  const TaskGrid({super.key});

  @override
  State<TaskGrid> createState() => _TaskGridState();
}

class _TaskGridState extends State<TaskGrid> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.37,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Samaya Users Details')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      print(snapshot.data?.docs[index]);
                      // return SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.25,
                      //   child: Column(
                      //     children: [
                      //       Text("${snapshot.data?.docs[index]['tag'][0]}"),
                      //       Text("${snapshot.data?.docs[index]['task']}"),
                      //       Text("${snapshot.data?.docs[index]['Description']}"),
                      //       Text("${snapshot.data?.docs[index]['end date']}"),
                      //       Text("${snapshot.data?.docs[index]['Choose time']}"),
                      //     ],
                      //   ),
                      // );
                      return TaskCard(
                        taskTag: "${snapshot.data?.docs[index]['tag'][0]}",
                        taskTitle: "${snapshot.data?.docs[index]['task']}",
                        taskDescription:
                            "${snapshot.data?.docs[index]['Description']}",
                        dueDate: "${snapshot.data?.docs[index]['enddate']}",
                        startTime:
                            "${snapshot.data?.docs[index]['Choosetime']}",
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
      ),
    );
  }
}
