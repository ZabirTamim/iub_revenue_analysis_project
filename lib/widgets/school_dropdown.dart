import 'package:flutter/material.dart';

class SchoolDropdown extends StatefulWidget {
  const SchoolDropdown({Key? key, this.sdCallback}) : super(key: key);

  final Function? sdCallback;

  @override
  State<SchoolDropdown> createState() => _SchoolDropdownState();
}

class _SchoolDropdownState extends State<SchoolDropdown> {
  @override
  Widget build(BuildContext context) {
    String _dropdownvalue = 'SETS';
    List<String> schools = [
      'SETS',
      'SBE',
      'SLASS',
      'SELS',
      'SPPH',
    ];

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButton(
            value: _dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: schools.map((String schools) {
              return DropdownMenuItem(
                value: schools,
                child: Text(schools),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _dropdownvalue = newValue!;
                print(_dropdownvalue);
                widget.sdCallback!(_dropdownvalue);
              });
            },
          ),
        );
      },
    );
  }
}
