import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constants.dart';

class TextAuth extends StatelessWidget {
  const TextAuth({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: const TextStyle(
        color: AppColors.blackColor,
        fontSize: 16,
      ),
    );
  }
}
