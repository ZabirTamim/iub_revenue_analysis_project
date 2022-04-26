class RAPData {
  String? SemesterName, School_ID, SemesterNumber, Year_No, Revenue;

  RAPData({
    this.SemesterName,
    this.School_ID,
    this.SemesterNumber,
    this.Year_No,
    this.Revenue,
  });
  //constructor

  factory RAPData.fromJson(Map<String, dynamic> json) {
    return RAPData(
      SemesterName: json['SemesterName'],
      School_ID: json['School_ID'],
      SemesterNumber: json['SemesterNumber'],
      Year_No: json['Year_No'],
      Revenue: json['Revenue'],
    );
  }
}
