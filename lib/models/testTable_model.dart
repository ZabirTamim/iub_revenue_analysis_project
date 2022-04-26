class Student {
  String? Faculty_ID, School_ID, FirstName;

  Student({
    this.Faculty_ID,
    this.School_ID,
    this.FirstName,
  });
  //constructor

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      Faculty_ID: json['Faculty_ID'],
      School_ID: json['School_ID'],
      FirstName: json['FirstName'],
    );
  }

  /* Map<String, dynamic> toJson() => {
        //'ID': ID,
        'FirstName': FirstName,
        'LastName': LastName,
        //'Age': Age,
        //'EarnedCredit': EarnedCredit,
      };*/
}
