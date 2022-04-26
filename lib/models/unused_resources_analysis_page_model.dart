class URAPData {
  String? School_ID,
      Year_No,
      SemesterNumber,
      AVG_ENROLLED,
      AVG_Room,
      Unused,
      Unused_percent;

  URAPData({
    this.School_ID,
    this.Year_No,
    this.SemesterNumber,
    this.AVG_ENROLLED,
    this.AVG_Room,
    this.Unused,
    this.Unused_percent,
  });
  //constructor

  factory URAPData.fromJson(Map<String, dynamic> json) {
    return URAPData(
        School_ID: json['School_ID'],
        Year_No: json['Year_No'],
        SemesterNumber: json['SemesterNumber'],
        AVG_ENROLLED: json['AVG_ENROLLED'],
        AVG_Room: json['AVG_Room'],
        Unused: json['Unused'],
        Unused_percent: json['Unused_percent']);
  }
}
