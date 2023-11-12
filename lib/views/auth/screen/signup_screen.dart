import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/auth/auth_controller.dart';
import 'package:hotel_booking_app/views/auth/components/button_auth.dart';
import 'package:hotel_booking_app/views/auth/components/more_auth.dart';
import 'package:hotel_booking_app/views/auth/components/text_auth.dart';
import 'package:hotel_booking_app/views/auth/components/text_field_auth.dart';
import 'package:hotel_booking_app/views/auth/components/text_title_auth.dart';

class SignupScreen extends GetView<AuthController> {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                const TextTitleAuth(),
                const SizedBox(height: 5),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      const TextAuth(
                        labelText: "User Name",
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(height: 8),
                      const TextFieldAuth(
                        obsecureText: false,
                        hintText: "enter your name",
                      ),
                      const SizedBox(height: 18),
                      const TextAuth(
                        labelText: "Email",
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(height: 8),
                      const TextFieldAuth(
                        obsecureText: false,
                        hintText: "enter your email",
                      ),
                      const SizedBox(height: 18),
                      const TextAuth(
                        labelText: "Password",
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(height: 8),
                      const TextFieldAuth(
                        obsecureText: true,
                        hintText: "enter your password",
                      ),
                      const SizedBox(height: 18),
                      const TextAuth(
                        labelText: "Confirm Password",
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(height: 8),
                      const TextFieldAuth(
                        obsecureText: true,
                        hintText: "enter your password",
                      ),
                      const SizedBox(height: 25),
                      ButtonAuth(
                        onTap: () {
                          controller.goLogin();
                        },
                        labelText: "SingUp",
                      ),
                      const MoreAuth(),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: AppColors.gray3Color,
                            ),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              controller.goLogin();
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
