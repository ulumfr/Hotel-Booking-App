import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/auth/auth_controller.dart';
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
                      TextFieldAuth(
                        controller: controller.nameController,
                        obsecureText: false,
                        hintText: "enter your name",
                      ),
                      const SizedBox(height: 18),
                      const TextAuth(
                        labelText: "Email",
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(height: 8),
                      TextFieldAuth(
                        controller: controller.emailController,
                        obsecureText: false,
                        hintText: "enter your email",
                      ),
                      const SizedBox(height: 18),
                      const TextAuth(
                        labelText: "Password",
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(height: 8),
                      TextFieldAuth(
                        controller: controller.passwordController,
                        obsecureText: true,
                        hintText: "enter your password",
                      ),
                      const SizedBox(height: 18),
                      const TextAuth(
                        labelText: "Confirm Password",
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(height: 8),
                      TextFieldAuth(
                        controller: controller.confPasswordController,
                        obsecureText: true,
                        hintText: "enter your confirm password",
                      ),
                      const SizedBox(height: 25),
                      GestureDetector(
                        onTap: controller.isLoading.value
                            ? null
                            : () {
                                controller.registerUser(
                                  username:
                                      controller.nameController.text.trim(),
                                  email: controller.emailController.text.trim(),
                                  password:
                                      controller.passwordController.text.trim(),
                                  confPassword:
                                      controller.confPasswordController.text.trim(),
                                );
                              },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: controller.isLoading.value
                                ? const CircularProgressIndicator()
                                : const Text(
                                    "SignUp",
                                    style: TextStyle(
                                      color: AppColors.gray1Color,
                                      fontSize: 20,
                                    ),
                                  ),
                          ),
                        ),
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
