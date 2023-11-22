import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/auth/auth_controller.dart';
import 'package:hotel_booking_app/views/auth/components/text_field_otp_auth.dart';

class VerifyForgotScreen extends GetView<AuthController> {
  const VerifyForgotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.gray1Color,
        centerTitle: true,
        leading: const BackButton(
          color: AppColors.blackColor,
        ),
        elevation: 0,
        title: const Text(
          "Forget Password",
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: AppColors.gray1Color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.only(left: 70, right: 70, bottom: 40),
                  child: Text(
                    "We Have Sent You A Confirmation Message To Your Email Address. Enter The Text",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.gray4Color,
                      fontSize: 17,
                      height: 1.35,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Form(
                    onChanged: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFieldOtpAuth(),
                        TextFieldOtpAuth(),
                        TextFieldOtpAuth(),
                        TextFieldOtpAuth(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Receive Code ?",
                      style: TextStyle(
                        color: AppColors.gray4Color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Resend",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  child: GestureDetector(
                    onTap: () {
                      controller.goResetPass();
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
                          "Confirm",
                          style: TextStyle(
                            color: AppColors.gray1Color,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
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
