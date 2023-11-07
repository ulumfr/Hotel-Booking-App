import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constants.dart';

class MoreAuth extends StatelessWidget {
  const MoreAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 17),
      child: Column(
        children: [
          const Center(
            child: Text(
              "OR",
              style: TextStyle(
                color: AppColors.gray3Color,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 17),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/images/logo-google.png',
                  height: 26,
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/images/logo-fb.png',
                  height: 26,
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/images/logo-apple.png',
                  height: 26,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
