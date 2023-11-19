import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/controllers/main/homescreen_controller.dart';

class OTPScreen extends GetView<HomeScreenController> {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    // var passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Center(

        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  hintText: "OTP",
                  hintStyle: TextStyle(
                      fontSize: 20
                  )
              ),
            ),
            // const SizedBox(height: 15),
            // TextFormField(
            //   controller: passwordController,
            //   obscureText: true,
            //   decoration: const InputDecoration(
            //       hintText: "Password",
            //       hintStyle: TextStyle(
            //           fontSize: 20
            //       )
            //   ),
            // ),
            const SizedBox(height: 15),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    controller.user.verifyOTP(emailController.text);
                  },
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: const BoxDecoration(
                        color: Colors.yellow
                    ),
                    child: const Text("Verify"),
                  ),
                ),
                // const SizedBox(width: 15),
                // GestureDetector(
                //   onTap: (){
                //     controller.user.login(emailController.text.trim(), passwordController.text.trim());
                //   },
                //   child: Container(
                //     width: 100,
                //     height: 30,
                //     decoration: const BoxDecoration(
                //         color: Colors.yellow
                //     ),
                //     child: const Text("Login"),
                //   ),
                // ),
                // const SizedBox(width: 15),
                // GestureDetector(
                //   onTap: (){
                //     controller.user.gLogin();
                //   },
                //   child: Container(
                //     width: 100,
                //     height: 30,
                //     decoration: const BoxDecoration(
                //         color: Colors.yellow
                //     ),
                //     child: const Text("Google Login"),
                //   ),
                // ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
