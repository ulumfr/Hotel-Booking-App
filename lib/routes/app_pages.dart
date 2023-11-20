import 'package:get/get.dart';
import 'package:hotel_booking_app/controllers/auth/auth_controller.dart';
import 'package:hotel_booking_app/controllers/main/home/home_screen_controller.dart';
import 'package:hotel_booking_app/controllers/main/home/imagepicker_controller.dart';
import 'package:hotel_booking_app/controllers/main/main_screen_controller.dart';
import 'package:hotel_booking_app/controllers/main/home/webviewhotel_controller.dart';
import 'package:hotel_booking_app/controllers/onboarding/onboarding_screen_controller.dart';
import 'package:hotel_booking_app/controllers/onboarding/welcome_screen_controller.dart';
import 'package:hotel_booking_app/views/auth/auth_screen.dart';
import 'package:hotel_booking_app/views/auth/screen/forgot_pass_screen.dart';
import 'package:hotel_booking_app/views/auth/screen/login_screen.dart';
import 'package:hotel_booking_app/views/auth/screen/reset_pass_screen.dart';
import 'package:hotel_booking_app/views/auth/screen/signup_screen.dart';
import 'package:hotel_booking_app/views/auth/screen/verify_forgot_screen.dart';
import 'package:hotel_booking_app/views/main/components/home/webview/webview_nearby.dart';
import 'package:hotel_booking_app/views/main/components/home/webview/webview_popular.dart';
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
      name: '/login',
      page: () => const LoginScreen(),
      binding: BindingsBuilder(() {
        // Get.lazyPut(() => AuthController());
        Get.put(AuthController());
      }),
    ),
    GetPage(
      name: '/signup',
      page: () => const SignupScreen(),
      // binding: BindingsBuilder(() {
      //   Get.lazyPut(() => AuthController());
      // }),
    ),
    GetPage(
      name: '/forgot',
      page: () => const ForgotPassScreen(),
      // binding: BindingsBuilder(() {
      //   Get.lazyPut(() => AuthController());
      // }),
    ),
    GetPage(
      name: '/verify',
      page: () => const VerifyForgotScreen(),
      // binding: BindingsBuilder(() {
      //   Get.lazyPut(() => AuthController());
      // }),
    ),
    GetPage(
      name: '/reset',
      page: () => const ResetPassScreen(),
      // binding: BindingsBuilder(() {
      //   Get.lazyPut(() => AuthController());
      // }),
    ),
    GetPage(
      name: '/auth',
      page: () => const AuthScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
      }),
    ),
    GetPage(
      name: '/main',
      page: () => const MainScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => MainScreenController());
        Get.lazyPut(() => ImagepickerController());
        Get.lazyPut(() => HomeScreenController());
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
