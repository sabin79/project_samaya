import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewTaskController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;

  var selected = "".obs;

  TextEditingController title = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController endTime = TextEditingController();
  TextEditingController description = TextEditingController();

  void setSelected(String value) {
    selected.value = value;
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
}
