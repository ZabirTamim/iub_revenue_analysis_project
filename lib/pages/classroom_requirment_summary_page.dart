import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iub_revenue_analysis/models/crs_page_model.dart';
import 'package:iub_revenue_analysis/tables/crs_table.dart';
import 'package:iub_revenue_analysis/tables/revenue_analysis_table.dart';
import 'package:iub_revenue_analysis/widgets/app_bar.dart';
import 'package:iub_revenue_analysis/widgets/checkbox.dart';
import 'package:iub_revenue_analysis/widgets/school_dropdown.dart';
import 'package:iub_revenue_analysis/widgets/datagenerate_button.dart';
import 'package:iub_revenue_analysis/constants/color_constants.dart';
import 'package:iub_revenue_analysis/models/revenue_analysis_page_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClassroomRequirmentSummeryPage extends StatefulWidget {
  const ClassroomRequirmentSummeryPage({Key? key}) : super(key: key);

  @override
  State<ClassroomRequirmentSummeryPage> createState() =>
      _ClassroomRequirmentSummeryPageState();
}

class _ClassroomRequirmentSummeryPageState
    extends State<ClassroomRequirmentSummeryPage> {
  var crsData;
  List<CRSData> crsDataList = [];
  //List<String> selectedSemesters = [];
  //String selectedSchool = "SETS";

  @override
  void initState() {
    super.initState();
    getCRSData();
  }

  Future getCRSData() async {
    final response = await http
        .get(Uri.parse("http://localhost/PHP/revanalysis/crsTable.php"));
    final items = json.decode(response.body);
    print(response.statusCode);
    //final myItems = <Map<String, dynamic>>[];
    /*
    for (var x in items['data']) {
      if (x['School_ID'] == selectedSchool) {
        myItems.add(x);
      }
    }
    print(myItems);
    //print(items);
    */

    return items;
  }

  @override
  Widget build(BuildContext context) {
    var _isvisible = false;
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return Scaffold(
          appBar: const MyAppBar(
            pageName: 'Classroom Requirment Summery',
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
                              //print(selectedSemesters);
                              //print(selectedSchool);
                              crsData = await getCRSData();
                              crsDataList =
                                  List<CRSData>.from(crsData['data'].map((i) {
                                return CRSData.fromJson(i);
                              }));
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
                    ? Padding(
                        padding: const EdgeInsets.all(16),
                        child: ListView(
                          primary: false,
                          children: [
                            CRSTable(
                              loadedData: crsDataList,
                            )
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
