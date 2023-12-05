import 'package:get/get.dart';

class AuthController extends GetxController {
  void goLoginFirebase() {
    Get.offAndToNamed('/loginFirebase');
  }

  void goLoginAppwrite() {
    Get.offAndToNamed('/loginAppwrite');
  }
}