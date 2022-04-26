import 'package:flutter/material.dart';
import 'package:iub_revenue_analysis/models/semseters_model.dart';
import 'package:iub_revenue_analysis/constants/color_constants.dart';

class SemesterCheckbox extends StatefulWidget {
  const SemesterCheckbox({Key? key, this.callback}) : super(key: key);

  final Function? callback;

  @override
  State<SemesterCheckbox> createState() => _SemesterCheckboxState();
}

class _SemesterCheckboxState extends State<SemesterCheckbox> {
  @override
  Widget build(BuildContext context) {
    List<Semesters> semesters = [
      Semesters(semesterName: 'Spring2020', semesterSelected: false),
      Semesters(semesterName: 'Autumn2020', semesterSelected: false),
      Semesters(semesterName: 'Summer2021', semesterSelected: false),
      Semesters(semesterName: 'Spring2021', semesterSelected: false),
      Semesters(semesterName: 'Autumn2021', semesterSelected: false),
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
                      widget.callback!("${semesters[index].semesterName}");
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
