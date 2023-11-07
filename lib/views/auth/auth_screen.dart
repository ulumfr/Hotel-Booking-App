import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/controllers/auth/auth_controller.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
    // Ini di buat gabungin login dan signup saat sudah ada data auth firebasenya, 
    // jadi memakai kondisi if else nanti
    // jadi sementara ini hanya pake direct pages
  }
}
