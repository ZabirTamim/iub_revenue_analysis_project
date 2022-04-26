import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iub_revenue_analysis/models/unused_resources_analysis_page_model.dart';
import 'package:iub_revenue_analysis/tables/unused_resources_table.dart';
import 'package:iub_revenue_analysis/widgets/app_bar.dart';
import 'package:iub_revenue_analysis/widgets/checkbox.dart';
import 'package:iub_revenue_analysis/widgets/datagenerate_button.dart';
import 'package:iub_revenue_analysis/constants/color_constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UnusedresourcesAnalysisPage extends StatefulWidget {
  const UnusedresourcesAnalysisPage({Key? key}) : super(key: key);

  @override
  State<UnusedresourcesAnalysisPage> createState() =>
      _UnusedresourcesAnalysisPageState();
}

class _UnusedresourcesAnalysisPageState
    extends State<UnusedresourcesAnalysisPage> {
  var uRapData;
  var uRapChartData;
  List<URAPData> uRapDataList = [];
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();

    _tooltip = TooltipBehavior(enable: true);
    getURAPData();
  }

  Future getURAPData() async {
    final response = await http
        .get(Uri.parse("http://localhost/PHP/revanalysis/urapTable.php"));
    final items = json.decode(response.body);
    print(response.statusCode);

    return items;
  }

  Future getURapChartData() async {
    final items = await getURAPData();
    double selsSum = 0;
    double spphSum = 0;
    double setsSum = 0;
    double slassSum = 0;
    double sbeSum = 0;
    for (var item in items['data']) {
      if (item['School_ID'] == 'SETS') {
        setsSum = setsSum + double.parse(item['Unused_percent']);
      } else if (item['School_ID'] == 'SELS') {
        selsSum = selsSum + double.parse(item['Unused_percent']);
      } else if (item['School_ID'] == 'SPPH') {
        spphSum = spphSum + double.parse(item['Unused_percent']);
      } else if (item['School_ID'] == 'SLASS') {
        slassSum = slassSum + double.parse(item['Unused_percent']);
      } else if (item['School_ID'] == 'SBE') {
        sbeSum = sbeSum + double.parse(item['Unused_percent']);
      }
    }
    List<double> chartSums = [setsSum, selsSum, slassSum, spphSum, sbeSum];
    return chartSums;
  }

  @override
  Widget build(BuildContext context) {
    var _isvisible = false;
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return Scaffold(
          appBar: const MyAppBar(
            pageName: 'Analysis Of Unused Resources',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DataGenButton(
                            buttonName: 'Generate Data',
                            onPress: () async {
                              uRapData = await getURAPData();
                              uRapChartData = await getURapChartData();
                              uRapDataList =
                                  List<URAPData>.from(uRapData["data"].map((i) {
                                return URAPData.fromJson(i);
                              }));

                              data = [
                                _ChartData('SETS', uRapChartData[0]),
                                _ChartData('SELS', uRapChartData[1]),
                                _ChartData('SLASS', uRapChartData[2]),
                                _ChartData('SPPH', uRapChartData[3]),
                                _ChartData('SBE', uRapChartData[4])
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
                    ? (uRapData["error"])
                        ? Text(uRapData["errmsg"])
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
                                              maximum: 400,
                                              interval: 100),
                                          tooltipBehavior: _tooltip,
                                          series: <ChartSeries>[
                                            // Renders line chart
                                            LineSeries<_ChartData, String>(
                                              dataSource: data,
                                              xValueMapper:
                                                  (_ChartData data, _) =>
                                                      data.x,
                                              yValueMapper:
                                                  (_ChartData data, _) =>
                                                      data.y,
                                              name: 'Unused Resources',
                                              color: Colors.red,
                                            )
                                          ])),
                                ),
                                UnusedResoucesTable(
                                  loadedData: uRapDataList,
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
