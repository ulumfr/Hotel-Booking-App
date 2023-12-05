import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/auth/auth_controller.dart';
import 'package:hotel_booking_app/views/auth/components/button_auth.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Authentication",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              ButtonAuth(
                text: "Login with Firebase (Inactive)",
                onTap: () {
                  controller.goLoginFirebase();
                },
              ),
              const SizedBox(height: 20),
              ButtonAuth(
                text: "Login with Appwrite",
                onTap: () {
                  controller.goLoginAppwrite();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
