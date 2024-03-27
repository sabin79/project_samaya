import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../task/subtask_tile.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
            .collection('Samaya Users Details')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  print(snapshot.data?.docs[index]);

                  return TaskTile(
                    taskName: "${snapshot.data?.docs[index]['task']}",
                    endTime: DateTime(202, 7, 23, 10, 00),
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
    );
  }
}
