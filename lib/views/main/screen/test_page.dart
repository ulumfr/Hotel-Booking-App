import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/views/main/screen/auth_controller.dart';

class Testing extends StatelessWidget {
  String email;
  Testing({Key? key,required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(email),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: (){
                AuthController.instance.logOut();
              },
              child: Container(
                width: 100,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.yellow
                ),
                child: const Text("LogOut"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
