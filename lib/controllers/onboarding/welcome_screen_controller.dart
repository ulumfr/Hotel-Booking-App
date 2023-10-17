import 'package:get/get.dart';
import 'package:hotel_booking_app/views/onboarding/onboarding_screen.dart';

class WelcomeScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAll(() => const OnboardingScreen());
    });
  }
}
