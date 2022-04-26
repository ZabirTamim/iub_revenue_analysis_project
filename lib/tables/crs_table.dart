import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:iub_revenue_analysis/models/crs_page_model.dart';

class CRSTable extends StatelessWidget {
  const CRSTable({Key? key, this.loadedData}) : super(key: key);

  final List<CRSData>? loadedData;

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columnSpacing: 12,
      horizontalMargin: 12,
      minWidth: 600,
      columns: const [
        DataColumn(
          label: Text('Class sizes'),
        ),
        DataColumn(
          label: Text('Capacity'),
        ),
        DataColumn(
          label: Text('Classroom for 7'),
        ),
        DataColumn(
          label: Text('Classroom for 8'),
        ),
      ],
      rows: loadedData!.map((nameone) {
        return DataRow(//return table row in every loop
            cells: [
          //table cells inside table row
          DataCell(
            Text(nameone.Class_Size!),
          ),
          DataCell(
            Text(nameone.Capacity_i!),
          ),
          DataCell(Text(nameone.ClassRoom_7!)),
          DataCell(Text(nameone.ClassRoom_8!)),
        ]);
      }).toList(),
    );
  }
}
