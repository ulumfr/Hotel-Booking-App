
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/main/homescreen_controller.dart';

class Hbindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
    // Get.put(SharedPreferences());
    // Get.put(AnotherController());
    // Add any other dependencies you need
  }
}
