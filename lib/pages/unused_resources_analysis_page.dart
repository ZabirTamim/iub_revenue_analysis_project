import 'package:flutter/material.dart';
import 'package:iub_revenue_analysis/widgets/app_bar.dart';
import 'package:iub_revenue_analysis/widgets/checkbox.dart';
import 'package:iub_revenue_analysis/widgets/datagenerate_button.dart';
import 'package:iub_revenue_analysis/constants/color_constants.dart';
import 'package:iub_revenue_analysis/tables/revenue_analysis_table.dart';

class UnusedresourcesAnalysisPage extends StatelessWidget {
  const UnusedresourcesAnalysisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
