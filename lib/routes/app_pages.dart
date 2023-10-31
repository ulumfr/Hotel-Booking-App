import 'package:get/get.dart';
import 'package:hotel_booking_app/controllers/main/imagepicker_controller.dart';
import 'package:hotel_booking_app/controllers/main/main_screen_controller.dart';
import 'package:hotel_booking_app/controllers/main/webviewhotel_controller.dart';
import 'package:hotel_booking_app/controllers/onboarding/onboarding_screen_controller.dart';
import 'package:hotel_booking_app/controllers/onboarding/welcome_screen_controller.dart';
import 'package:hotel_booking_app/views/main/components/webview/webview_nearby.dart';
import 'package:hotel_booking_app/views/main/components/webview/webview_popular.dart';
import 'package:hotel_booking_app/views/main/main_screen.dart';
import 'package:hotel_booking_app/views/onboarding/onboarding_screen.dart';
import 'package:hotel_booking_app/views/onboarding/welcome_screen.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: '/welcome',
      page: () => const WelcomeScreen(),
      binding: BindingsBuilder(() {
        Get.put(WelcomeScreenController());
      }),
    ),
    GetPage(
      name: '/onboarding',
      page: () => const OnboardingScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => OnboardingScreenController());
      }),
    ),
    GetPage(
      name: '/main',
      page: () => const MainScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => MainScreenController());
        Get.lazyPut(() => ImagepickerController());
        Get.lazyPut<WebviewhotelController>(() => WebviewhotelController());
      }),
    ),
    GetPage(
      name: '/webpopular',
      page: () => const WebviewPopular(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => WebviewhotelController());
      }),
    ),
    GetPage(
      name: '/webnearby',
      page: () => const WebviewNearby(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => WebviewhotelController());
      }),
    ),
  ];
}
