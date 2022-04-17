import 'package:flutter/material.dart';
import 'package:iub_revenue_analysis/widgets/app_bar.dart';
import 'package:iub_revenue_analysis/widgets/datagenerate_button.dart';
import 'package:iub_revenue_analysis/constants/color_constants.dart';
import 'package:iub_revenue_analysis/tables/revenue_analysis_table.dart';
import 'package:iub_revenue_analysis/widgets/studentrange_dropdown.dart';

class OfferedSectionsAnalysisPage extends StatelessWidget {
  const OfferedSectionsAnalysisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        pageName: 'Analysis of Section per Class Sizes in SETS',
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
                      'select student range: ',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      StudentRangeDropdown(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
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
                        onPress: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                primary: false,
                children: const [
                  RevenueAnalysisTable(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
