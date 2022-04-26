import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iub_revenue_analysis/models/sps_analysis_page_model.dart';
import 'package:iub_revenue_analysis/tables/sps_analysis_table.dart';
import 'package:iub_revenue_analysis/widgets/app_bar.dart';
import 'package:iub_revenue_analysis/widgets/checkbox.dart';
import 'package:iub_revenue_analysis/widgets/datagenerate_button.dart';
import 'package:iub_revenue_analysis/widgets/maxstudent_dropdown.dart';
import 'package:iub_revenue_analysis/constants/color_constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentpersectionAnalysisPage extends StatefulWidget {
  const StudentpersectionAnalysisPage({Key? key}) : super(key: key);

  @override
  State<StudentpersectionAnalysisPage> createState() =>
      _StudentpersectionAnalysisPageState();
}

class _StudentpersectionAnalysisPageState
    extends State<StudentpersectionAnalysisPage> {
  var spsData;
  var spsChartData;
  List<SPSData> spsDataList = [];
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  String maxStudent = '61';

  @override
  void initState() {
    super.initState();

    _tooltip = TooltipBehavior(enable: true);
    getSPSData();
  }

  Future getSPSData() async {
    final response = await http
        .get(Uri.parse("http://localhost/PHP/revanalysis/spsTable.php"));
    final items = json.decode(response.body);
    print(response.statusCode);

    return items;
  }

  Future getSpsChartData() async {
    final items = await getSPSData();
    int selsSum = 0;
    int spphSum = 0;
    int setsSum = 0;
    int slassSum = 0;
    int sbeSum = 0;
    for (var item in items['data']) {
      if (item['School_ID'] == 'SETS') {
        setsSum = setsSum + int.parse(item['Section_Count']);
      } else if (item['School_ID'] == 'SELS') {
        selsSum = selsSum + int.parse(item['Section_Count']);
      } else if (item['School_ID'] == 'SPPH') {
        spphSum = spphSum + int.parse(item['Section_Count']);
      } else if (item['School_ID'] == 'SLASS') {
        slassSum = slassSum + int.parse(item['Section_Count']);
      } else if (item['School_ID'] == 'SBE') {
        sbeSum = sbeSum + int.parse(item['Section_Count']);
      }
    }
    List<int> chartSums = [setsSum, selsSum, slassSum, spphSum, sbeSum];
    return chartSums;
  }

  @override
  Widget build(BuildContext context) {
    var _isvisible = false;
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return Scaffold(
          appBar: const MyAppBar(
            pageName: 'Analysis Of Student Per Section',
          ),
          backgroundColor: Colors.white,
          body: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: kBackgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'select semester\'s: ',
                        ),
                      ),
                      const SemesterCheckbox(),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'select maximum student\'s: ',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaxStudentDropdown(
                            callback: (value) => maxStudent = value,
                          ),
                        ],
                      ),
                      Divider(),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DataGenButton(
                            buttonName: 'Generate Data',
                            onPress: () async {
                              spsData = await getSPSData();
                              spsChartData = await getSpsChartData();
                              spsDataList =
                                  List<SPSData>.from(spsData["data"].map((i) {
                                return SPSData.fromJson(i);
                              }));
                              data = [
                                _ChartData('SETS', spsChartData[0]),
                                _ChartData('SELS', spsChartData[1]),
                                _ChartData('SLASS', spsChartData[2]),
                                _ChartData('SPPH', spsChartData[3]),
                                _ChartData('SBE', spsChartData[4])
                              ];
                              setState(() {
                                _isvisible = true;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: _isvisible == true
                    ? (spsData["error"])
                        ? Text(spsData["errmsg"])
                        : Padding(
                            padding: const EdgeInsets.all(16),
                            child: ListView(
                              primary: false,
                              children: [
                                Card(
                                  child: SizedBox(
                                    height: 400,
                                    child: SfCartesianChart(
                                      primaryXAxis: CategoryAxis(),
                                      primaryYAxis: NumericAxis(
                                          minimum: 0,
                                          maximum: 200,
                                          interval: 50),
                                      tooltipBehavior: _tooltip,
                                      series: <ChartSeries<_ChartData, String>>[
                                        ColumnSeries<_ChartData, String>(
                                          dataSource: data,
                                          xValueMapper: (_ChartData data, _) =>
                                              data.x,
                                          yValueMapper: (_ChartData data, _) =>
                                              data.y,
                                          name: 'Total sections',
                                          color: Color.fromRGBO(8, 142, 255, 1),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SPSAnalysisTable(
                                  loadedData: spsDataList,
                                ),
                              ],
                            ),
                          )
                    : Container(
                        color: Colors.white,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
