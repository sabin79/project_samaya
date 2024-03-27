import 'package:flutter/material.dart';
import '../task/subtask_tile.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          TaskTile(
            taskName: 'Meeting about',
            endTime: DateTime(
              2024,
              7,
              23,
            ),
          ),
          TaskTile(
            taskName: 'Meeting with the client',
            endTime: DateTime(2023, 7, 23, 10, 00),
          ),
          TaskTile(
            taskName: 'Code the interface',
            endTime: DateTime(
              2023,
              7,
              23,
            ),
          ),
          //  TaskOverviewCard(),
        ],
      ),
    );
  }
}
