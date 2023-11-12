import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constants.dart';

class TextTitleAuth extends StatelessWidget {
  const TextTitleAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Hotels",
      style: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 35,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
