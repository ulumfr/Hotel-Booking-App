import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/views/main/screen/auth_controller.dart';

class HomeScreenController extends GetxController {
  // Rx<TextEditingController> textf = TextEditingController();
  late AuthController user;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late TextEditingController emailController, passwordController;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    user = AuthController.instance;
    super.onInit();
  }

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference details = firestore.collection("hotel_details");
    return details.get();
  }

  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void clear(){
    emailController.clear();
    passwordController.clear();
  }
}