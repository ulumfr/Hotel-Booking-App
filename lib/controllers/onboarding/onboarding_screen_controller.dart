import 'package:get/get.dart';
import 'package:hotel_booking_app/views/main/main_screen.dart';

class OnboardingScreenController extends GetxController {
  var currentIndex = 0.obs;

  ganti(int index) {
    currentIndex.value = index;
  }

  void skipToMainScreen() {
    Get.to(() => const MainScreen());
  }
}
