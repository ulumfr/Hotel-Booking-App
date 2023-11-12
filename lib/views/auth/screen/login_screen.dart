import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/auth/auth_controller.dart';
import 'package:hotel_booking_app/views/auth/components/button_auth.dart';
import 'package:hotel_booking_app/views/auth/components/more_auth.dart';
import 'package:hotel_booking_app/views/auth/components/text_auth.dart';
import 'package:hotel_booking_app/views/auth/components/text_field_auth.dart';
import 'package:hotel_booking_app/views/auth/components/text_title_auth.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);

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
                const SizedBox(height: 24),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Login to your account",
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const TextAuth(
                        labelText: "Email",
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(height: 8),
                      const TextFieldAuth(
                        obsecureText: false,
                        hintText: "enter your email",
                      ),
                      const SizedBox(height: 22),
                      const TextAuth(
                        labelText: "Password",
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(height: 8),
                      const TextFieldAuth(
                        obsecureText: true,
                        hintText: "enter your password",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.goForgot();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Ink(
                                child: const Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                    color: AppColors.gray4Color,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      ButtonAuth(
                        onTap: () {
                          controller.goMain();
                        },
                        labelText: "Login",
                      ),
                      const MoreAuth(),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have account?",
                            style: TextStyle(
                              color: AppColors.gray3Color,
                            ),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              controller.goSignup();
                            },
                            child: const Text(
                              "SignUp",
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
