import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constants.dart';

class TextSeeall extends StatelessWidget {
  const TextSeeall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'See All',
      style: TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w800,
        fontSize: 13,
      ),
    );
  }
}
