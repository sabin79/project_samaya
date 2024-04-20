// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class MainTaskModel {
  String? ChooseTime;
  String? Description;
  DateTime? enddate;
  List<String>? tag;
  List<String>? employee;
  String? task;
  String? uid;
  MainTaskModel({
    this.ChooseTime,
    this.Description,
    this.enddate,
    this.tag,
    this.employee,
    this.task,
    this.uid,
  });

  MainTaskModel copyWith({
    String? ChooseTime,
    String? Description,
    DateTime? enddate,
    List<String>? tag,
    List<String>? employee,
    String? task,
    String? uid,
  }) {
    return MainTaskModel(
      ChooseTime: ChooseTime ?? this.ChooseTime,
      Description: Description ?? this.Description,
      enddate: enddate ?? this.enddate,
      tag: tag ?? this.tag,
      employee: employee ?? this.employee,
      task: task ?? this.task,
      uid: uid ?? this.uid,
    );
  }
}
