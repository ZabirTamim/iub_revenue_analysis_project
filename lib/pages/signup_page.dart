import 'package:flutter/material.dart';
import 'package:iub_revenue_analysis/widgets/signuppage_textfield.dart';
import 'package:get/get.dart';
import 'package:iub_revenue_analysis/pages/home_page.dart';
import 'package:iub_revenue_analysis/constants/color_constants.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHomeBackgroundColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Hero(
            tag: 'iub_image',
            child: Image(
              height: 400,
              width: 400,
              image: AssetImage('assets/images/iub_logo_1.png'),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SignupPageTextField(
                hintText: 'e-mail',
                isObsecure: false,
              ),
              const SizedBox(
                height: 60,
              ),
              const SignupPageTextField(
                hintText: 'password',
                isObsecure: true,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(200, 60),
                  ),
                  onPressed: () {
                    Get.to(const HomePage());
                  },
                  child: const Text(
                    "Sign in",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kButtonTextColor,
                      fontFamily: 'RobotoMono',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
