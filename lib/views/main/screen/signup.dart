import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/controllers/main/homescreen_controller.dart';

class SignUp extends GetView<HomeScreenController> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(

        child: Column(
          children: [
            TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                  hintText: "email",
                  hintStyle: TextStyle(
                    fontSize: 20
                  )
                ),
              ),
            const SizedBox(height: 15),
        TextFormField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                        fontSize: 20
                    )
                ),
              ),
            const SizedBox(height: 15),
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    if(await controller.user.sendOTP(controller.emailController.text.trim(), controller.passwordController.text.trim())){
                      controller.clear();
                    }
                  },
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.yellow
                    ),
                    child: const Text("SignUp"),
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: (){
                    controller.user.login(controller.emailController.text.trim(), controller.passwordController.text.trim());
                    controller.clear();
                    },
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: const BoxDecoration(
                        color: Colors.yellow
                    ),
                    child: const Text("Login"),
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: (){
                    controller.user.gLogin();
                  },
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: const BoxDecoration(
                        color: Colors.yellow
                    ),
                    child: const Text("Google Login"),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
