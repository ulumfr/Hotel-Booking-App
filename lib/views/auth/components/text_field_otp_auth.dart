import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking_app/constants.dart';

class TextFieldOtpAuth extends StatelessWidget {
  const TextFieldOtpAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.textColor,
                width: 3,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 3,
              ),
            ),
          ),
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 30,
          ),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
      ),
    );
  }
}
