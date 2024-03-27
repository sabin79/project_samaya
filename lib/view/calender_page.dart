import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Calender",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ),
        body: Center(
          child: SfCalendar(
            view: CalendarView.week,
            todayHighlightColor: Colors.blue,
            showNavigationArrow: true,
          ),
        ),
      ),
    );
  }
}
