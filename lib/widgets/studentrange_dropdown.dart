import 'package:flutter/material.dart';

class StudentRangeDropdown extends StatefulWidget {
  const StudentRangeDropdown({Key? key}) : super(key: key);

  @override
  State<StudentRangeDropdown> createState() => _StudentRangeDropdownState();
}

class _StudentRangeDropdownState extends State<StudentRangeDropdown> {
  @override
  Widget build(BuildContext context) {
    String _dropdownvalue = '1-10';
    List<String> studentRange = [
      '1-10',
      '11-20',
      '31-40',
      '41-50',
      '51-60',
      '60+',
    ];

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButton(
            value: _dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: studentRange.map((String studentRange) {
              return DropdownMenuItem(
                value: studentRange,
                child: Text(studentRange),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _dropdownvalue = newValue!;
                print(_dropdownvalue);
              });
            },
          ),
        );
      },
    );
  }
}
