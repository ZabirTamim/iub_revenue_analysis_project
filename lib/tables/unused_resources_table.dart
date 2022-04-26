import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:iub_revenue_analysis/models/unused_resources_analysis_page_model.dart';

class UnusedResoucesTable extends StatelessWidget {
  const UnusedResoucesTable({Key? key, this.loadedData}) : super(key: key);
  final List<URAPData>? loadedData;

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columnSpacing: 12,
      horizontalMargin: 12,
      minWidth: 600,
      sortAscending: true,
      border: TableBorder(),
      columns: const [
        DataColumn(
          label: Text(
            'School_ID',
          ),
        ),
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text('Semester'),
        ),
        DataColumn(
          label: Text('Average Enrolled'),
        ),
        DataColumn(
          label: Text('Average per room'),
        ),
        DataColumn(
          label: Text('Unused'),
        ),
        DataColumn(
          label: Text('Unused %'),
        ),
      ],
      rows: loadedData!.map((nameone) {
        return DataRow(//return table row in every loop
            cells: [
          //table cells inside table row
          DataCell(Text(nameone.School_ID!)),
          DataCell(Text(nameone.Year_No!)),
          DataCell(Text(nameone.SemesterNumber!)),
          DataCell(Text(nameone.AVG_ENROLLED!)),
          DataCell(Text(nameone.AVG_Room!)),
          DataCell(Text(nameone.Unused!)),
          DataCell(Text(nameone.Unused_percent!)),
        ]);
      }).toList(),
    );
  }
}
