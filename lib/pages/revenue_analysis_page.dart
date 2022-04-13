import 'package:flutter/material.dart';
import 'package:iub_revenue_analysis/constants/color_constants.dart';
import 'package:iub_revenue_analysis/tables/revenue_analysis_table.dart';
import 'package:iub_revenue_analysis/widgets/app_bar.dart';
import 'package:iub_revenue_analysis/widgets/homepage_button.dart';
import 'package:iub_revenue_analysis/widgets/checkbox.dart';
import 'package:iub_revenue_analysis/widgets/school_dropdown.dart';

class RevenueAnalysisPage extends StatelessWidget {
  const RevenueAnalysisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(
        pageName: 'Revenue Analysis',
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SemesterCheckbox(),
                HomepageButton(
                  buttonName: 'Generate Data',
                  onPress: () {},
                ),
                const SchoolDropdown(),
              ],
            ),
          ),
          const Divider(
            color: kHomeBackgroundColor,
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
