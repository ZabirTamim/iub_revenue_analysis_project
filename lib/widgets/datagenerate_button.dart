import 'package:flutter/material.dart';
import 'package:iub_revenue_analysis/constants/color_constants.dart';

class DataGenButton extends StatelessWidget {
  const DataGenButton({
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
        minimumSize: const Size(100, 40),
        maximumSize: const Size(100, 40),
      ),
      onPressed: onPress,
      child: Text(
        buttonName!,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: kHomeBackgroundColor,
          fontSize: 10.0,
        ),
      ),
    );
  }
}
