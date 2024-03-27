class MainTaskModel {
  String? mtTag;
  String? mtTitle;
  String? mtDesc;
  DateTime? endTime;
  DateTime? endDate;

  int? remind;

  MainTaskModel(
      {this.mtTag,
      this.mtTitle,
      this.mtDesc,
      this.endDate,
      this.endTime,
      this.remind});
}
