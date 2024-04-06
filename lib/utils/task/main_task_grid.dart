import 'package:flutter/material.dart';
import 'package:project_samaya/utils/task/main_task_card.dart';
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
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.38,
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
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
