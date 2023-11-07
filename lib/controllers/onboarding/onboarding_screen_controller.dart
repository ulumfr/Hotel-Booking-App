import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreenController extends GetxController {
  var currentIndex = 0.obs;
  final pageController = PageController();

  void ganti(int index) {
    currentIndex.value = index;
  }

  void skipToLoginScreen() {
    Get.offAndToNamed('/login');
  }
}
