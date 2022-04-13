import 'package:flutter/material.dart';

class SignupPageTextField extends StatelessWidget {
  const SignupPageTextField({
    Key? key,
    this.hintText,
    this.isObsecure,
  }) : super(key: key);

  final String? hintText;
  final bool? isObsecure;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 200,
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
        ),
        obscureText: isObsecure!,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF0E9D2),
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w200,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}
