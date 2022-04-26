import 'package:flutter/material.dart';

class MaxStudentDropdown extends StatefulWidget {
  const MaxStudentDropdown({Key? key, this.callback}) : super(key: key);

  final Function? callback;

  @override
  State<MaxStudentDropdown> createState() => _MaxStudentDropdownState();
}

class _MaxStudentDropdownState extends State<MaxStudentDropdown> {
  @override
  Widget build(BuildContext context) {
    String _dropdownvalue = '61';
    List<String> maxStudent = [];
    for (var i = 61; i > 0; i--) {
      maxStudent.add(i.toString());
    }

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButton(
            value: _dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: maxStudent.map((String maxStudent) {
              return DropdownMenuItem(
                value: maxStudent,
                child: Text(maxStudent),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _dropdownvalue = newValue!;
                print(_dropdownvalue);
                widget.callback!(_dropdownvalue);
              });
            },
          ),
        );
      },
    );
  }
}
