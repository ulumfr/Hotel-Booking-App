import 'package:get/get.dart';

class AuthController extends GetxController {
  void goLogin() {
    Get.toNamed('/login');
  }

  void goSignup() {
    Get.toNamed('/signup');
  }

  void goForgot() {
    Get.toNamed('/forgot');
  }

  void goVerify() {
    Get.toNamed('/verify');
  }

  void goResetPass() {
    Get.toNamed('/reset');
  }

  void goMain() {
    Get.offAndToNamed('/main');
  }
}
