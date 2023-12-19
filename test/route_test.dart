import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/controllers/auth/appwrite/auth_appwrite_controller.dart';
import 'package:hotel_booking_app/controllers/main/home/profile_screen_controller.dart';
import 'package:hotel_booking_app/routes/app_pages.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.put(ProfileScreenController());
  testWidgets('Test routes', (WidgetTester tester) async {
    // Initialize the app
    await tester.pumpWidget(GetMaterialApp(
      initialRoute: '/welcome',
      getPages: AppRoutes.pages,
    ));

    // Test the '/welcome' route
    expect(Get.currentRoute, '/welcome');

    // Navigate to the '/onboarding' route
    Get.toNamed('/loginAppwrite');
    await tester.pumpAndSettle();

    // Test the '/onboarding' route
    expect(Get.currentRoute, '/loginAppwrite');

    // Navigate to the '/loginFirebase' route
    Get.toNamed('/main');
    await tester.pumpAndSettle();

    // Test the '/loginFirebase' route
    expect(Get.currentRoute, '/main');
  });
}