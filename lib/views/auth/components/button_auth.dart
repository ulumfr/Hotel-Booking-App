import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constants.dart';

class ButtonAuth extends StatelessWidget {
  const ButtonAuth({
    Key? key,
    required this.onTap,
    required this.labelText,
  }) : super(key: key);

  final Function()? onTap;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Text(
            labelText,
            style: const TextStyle(
              color: AppColors.gray1Color,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
