class CRSData {
  String? Class_Size, Capacity_i, ClassRoom_7, ClassRoom_8;

  CRSData({
    this.Class_Size,
    this.Capacity_i,
    this.ClassRoom_7,
    this.ClassRoom_8,
  });
  //constructor

  factory CRSData.fromJson(Map<String, dynamic> json) {
    return CRSData(
      Class_Size: json['Class_Size'],
      Capacity_i: json['Capacity_i'],
      ClassRoom_7: json['ClassRoom_7'],
      ClassRoom_8: json['ClassRoom_8'],
    );
  }
}
