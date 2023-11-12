import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constants.dart';

class TextAuth extends StatelessWidget {
  const TextAuth({
    Key? key,
    required this.labelText,
    required this.fontweight,
  }) : super(key: key);

  final String labelText;
  final FontWeight fontweight;

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: TextStyle(
        color: AppColors.gray4Color,
        fontSize: 16,
        fontWeight: fontweight,
      ),
    );
  }
}
