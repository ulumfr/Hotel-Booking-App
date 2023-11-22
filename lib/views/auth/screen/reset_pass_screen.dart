import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/auth/auth_controller.dart';
import 'package:hotel_booking_app/views/auth/components/text_auth.dart';
import 'package:hotel_booking_app/views/auth/components/text_field_auth.dart';
import 'package:hotel_booking_app/views/auth/components/text_title_auth.dart';

class ResetPassScreen extends GetView<AuthController> {
  const ResetPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray1Color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                const TextTitleAuth(),
                Image.asset("assets/images/resetpassword.jpg", height: 250),
                const Text(
                  "Reset Password",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Text(
                    "Enter your new password and confirm it",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.gray3Color,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      const TextAuth(
                        labelText: "New Password",
                        fontweight: FontWeight.bold,
                      ),
                      const SizedBox(height: 8),
                      TextFieldAuth(
                        controller: controller.passwordController,
                        hintText: "enter your password",
                        obsecureText: controller.isSecure,
                      ),
                      const SizedBox(height: 22),
                      const TextAuth(
                        labelText: "Confirm Password",
                        fontweight: FontWeight.bold,
                      ),
                      const SizedBox(height: 8),
                      TextFieldAuth(
                        controller: controller.confPasswordController,
                        hintText: "enter your confirm password",
                        obsecureText: controller.isSecure,
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          controller.goLogin();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text(
                              "LogIn",
                              style: TextStyle(
                                color: AppColors.gray1Color,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
