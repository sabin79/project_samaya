import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Priority',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DatePriorityScreen(),
    );
  }
}

class DatePriorityScreen extends StatefulWidget {
  const DatePriorityScreen({super.key});

  @override
  State<DatePriorityScreen> createState() => _DatePriorityScreenState();
}

class _DatePriorityScreenState extends State<DatePriorityScreen> {
  final DateTime originalDateTime = DateTime.now();

  final DateTime manualDateTime = DateTime(2024, 3, 23);

  @override
  Widget build(BuildContext context) {
    final difference = manualDateTime.difference(originalDateTime).inDays;
    String priorityMessage =
        difference < 7 ? 'Higher Priority' : 'Normal Priority';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Priority'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              priorityMessage,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
