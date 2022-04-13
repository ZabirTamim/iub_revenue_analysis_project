import 'package:flutter/material.dart';
import 'package:iub_revenue_analysis/pages/home_page.dart';
import 'package:iub_revenue_analysis/pages/revenue_analysis_page.dart';
import 'package:iub_revenue_analysis/pages/signup_page.dart';
import 'package:get/get.dart';
import 'package:iub_revenue_analysis/pages/studentpersection_analysis_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Iub Revenue Analysis',
      theme: ThemeData(
        fontFamily: 'RobotoMono',
        backgroundColor: Colors.white,
        hintColor: Colors.blueGrey,
      ),
      home: const SignupPage(),
      getPages: [
        GetPage(name: '/', page: () => const SignupPage()),
        GetPage(name: '/home_page', page: () => const HomePage()),
        GetPage(name: '/revenue_page', page: () => const RevenueAnalysisPage()),
        GetPage(
            name: '/sps_page',
            page: () => const StudentpersectionAnalysisPage()),
      ],
    );
  }
}
