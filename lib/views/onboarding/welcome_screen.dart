import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/views/onboarding/onboarding_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) => {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const OnboardingScreen(),
              ),
              (route) => false)
        });
    return const Scaffold(
      body: Center(
        child: Text(
          "Hotels",
          style: TextStyle(
              color: AppColors.textColor,
              fontSize: 70,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}