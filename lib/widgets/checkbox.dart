import 'package:flutter/material.dart';
import 'package:iub_revenue_analysis/models/semseters_model.dart';
import 'package:iub_revenue_analysis/constants/color_constants.dart';

class SemesterCheckbox extends StatefulWidget {
  const SemesterCheckbox({Key? key}) : super(key: key);

  @override
  State<SemesterCheckbox> createState() => _SemesterCheckboxState();
}

class _SemesterCheckboxState extends State<SemesterCheckbox> {
  @override
  Widget build(BuildContext context) {
    List<Semesters> semesters = [
      Semesters(semesterName: 'Spring 2020', semesterSelected: false),
      Semesters(semesterName: 'Autumn 2020', semesterSelected: false),
      Semesters(semesterName: 'Summer 2021', semesterSelected: false),
      Semesters(semesterName: 'Spring 2021', semesterSelected: false),
      Semesters(semesterName: 'Autumn 2021', semesterSelected: false),
    ];
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return SizedBox(
          height: 150.0,
          width: 160,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 30.0,
                width: 150.0,
                child: CheckboxListTile(
                  title: Text(
                    semesters[index].semesterName!,
                    style: const TextStyle(
                      color: kTextColor,
                      fontSize: 10.0,
                    ),
                  ),
                  value: semesters[index].semesterSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      semesters[index].semesterSelected = value!;
                      print("${semesters[index].semesterName} is selected");
                    });
                  },
                  dense: true,
                ),
              );
            },
            itemCount: semesters.length,
          ),
        );
      },
    );
  }
}
