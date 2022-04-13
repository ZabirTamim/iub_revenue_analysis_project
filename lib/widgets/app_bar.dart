import 'package:flutter/material.dart';
import 'package:iub_revenue_analysis/constants/color_constants.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    this.pageName,
  }) : super(key: key);

  final String? pageName;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        pageName!,
        style: const TextStyle(
          color: kButtonTextColor,
        ),
      ),
      centerTitle: true,
      backgroundColor: kHomeBackgroundColor,
      actions: const [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Image(
            height: 50,
            width: 50,
            image: AssetImage('assets/images/iub_logo_3.png'),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
