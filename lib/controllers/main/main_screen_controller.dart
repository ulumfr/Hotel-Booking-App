import 'package:get/get.dart';

class MainScreenController extends GetxController {
  static MainScreenController get to => Get.find();

  final RxInt indexMainScreen = RxInt(0);
}
