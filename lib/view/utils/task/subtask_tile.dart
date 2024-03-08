import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class TaskTile extends StatefulWidget {
  final String taskName;
  final DateTime endTime;
  final DateTime curentTime = DateTime.now();
  TaskTile({
    super.key,
    required this.taskName,
    required this.endTime,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, left: 25, right: 25),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      widget.taskName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9),
                      child: SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.schedule,
                                  size: 16,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(DateFormat.jm().format(widget.endTime))
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: widget.curentTime.isAfter(widget.endTime)
                                  ? const TaskCompleted()
                                  : const TaskInProgress(),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCompleted extends StatelessWidget {
  const TaskCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          "Completd",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 15,
        )
      ],
    );
  }
}

class TaskInProgress extends StatelessWidget {
  const TaskInProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text("On Processing",
            style:
                TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
        SizedBox(
          width: 5,
        ),
        Icon(Icons.run_circle, color: Colors.orange, size: 15),
      ],
    );
  }
}
