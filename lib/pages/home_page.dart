import 'package:flutter/material.dart';
import 'package:iub_revenue_analysis/widgets/homepage_button.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181D31),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Hero(
            tag: 'iub_image',
            child: Image(
              height: 300,
              width: 300,
              image: AssetImage('assets/images/iub_logo_1.png'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomepageButton(
                buttonName: 'Revenue Analysis',
                onPress: () {
                  Get.toNamed('/revenue_page');
                },
              ),
              HomepageButton(
                buttonName: 'Analysis of Students per Section',
                onPress: () {
                  Get.toNamed('/sps_page');
                },
              ),
              HomepageButton(
                buttonName: 'Analysis of Unused Resources',
                onPress: () {
                  Get.toNamed('/unresources_page');
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomepageButton(
                buttonName: 'Analysis of Section per Class Sizes in SETS',
                onPress: () {
                  Get.toNamed('/offeredsec_page');
                },
              ),
              HomepageButton(
                buttonName: 'Classroom requirement summary',
                onPress: () {},
              ),
              HomepageButton(
                buttonName: 'Developer Team',
                onPress: () {},
              ),
            ],
          ),
          HomepageButton(
            buttonName: 'Input Data Manually',
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
