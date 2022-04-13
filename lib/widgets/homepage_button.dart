import 'package:flutter/material.dart';
import 'package:iub_revenue_analysis/constants/color_constants.dart';

class HomepageButton extends StatelessWidget {
  const HomepageButton({
    Key? key,
    this.buttonName,
    this.onPress,
  }) : super(key: key);

  final String? buttonName;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF678983),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(300, 60),
        maximumSize: const Size(300, 60),
      ),
      onPressed: onPress,
      child: Text(
        buttonName!,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: kTextColor,
        ),
      ),
    );
  }
}
