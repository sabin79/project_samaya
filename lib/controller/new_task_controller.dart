import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewTaskController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;
  DateTime _selectedDate = DateTime.now();
  var formattedDate;
  String selected = "".obs.toString();

  TextEditingController title = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController endTime = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController repeat = TextEditingController();

  void setSelected(String value) {
    selected = value;
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2027));
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      endDate.text = DateFormat.yMd().format(selectedDate.value);
    }
  }

  chooseTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: selectedTime.value,
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!);
      },
    );
    if (pickedTime != null) {
      selectedTime.value = pickedTime;
      endTime.text = pickedTime.format(Get.context!).toString();
    }
  }

  _getDateFromUser() async {
    final DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: _selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      // setState(() {
      //   _selectedDate = pickedDate;
      // });
      _selectedDate = pickedDate;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      // setState(() {
      _selectedDate = picked;
      // flag = 1;
      // });
    }
    var date = DateTime.parse(selectedDate.toString());
    formattedDate = "${date.day}-${date.month}-${date.year}";
  }
}
