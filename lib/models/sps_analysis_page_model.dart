class SPSData {
  String? School_ID, SemesterNumber, Year_No, Section_Count;

  SPSData({
    this.School_ID,
    this.SemesterNumber,
    this.Year_No,
    this.Section_Count,
  });
  //constructor

  factory SPSData.fromJson(Map<String, dynamic> json) {
    return SPSData(
      School_ID: json['School_ID'],
      SemesterNumber: json['SemesterNumber'],
      Year_No: json['Year_No'],
      Section_Count: json['Section_Count'],
    );
  }
}
