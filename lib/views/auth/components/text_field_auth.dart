import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constants.dart';

class TextFieldAuth extends StatelessWidget {
  const TextFieldAuth({
    Key? key,
    required this.hintText,
    required this.obsecureText,
  }) : super(key: key);

  final String hintText;
  final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsecureText,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.gray2Color),
        ),
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.gray3Color,
          fontSize: 14.5,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
      ),
    );
  }
}
