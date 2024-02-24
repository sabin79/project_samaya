class MainTaskModel {
  String? mtTag;
  String? mtTitle;
  String? mtDesc;
  DateTime? endTime;
  DateTime? endDate;
  List<SubtaskModel>? subtask;

  MainTaskModel(
      {this.mtTag,
      this.mtTitle,
      this.mtDesc,
      this.endDate,
      this.endTime,
      this.subtask});
}

class SubtaskModel {
  String? stTitle;
  DateTime? endTime;

  SubtaskModel({this.stTitle, this.endTime});
}
