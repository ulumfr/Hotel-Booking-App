import 'package:appwrite/appwrite.dart';

import 'package:get/get.dart';
import 'package:hotel_booking_app/controllers/auth/appwrite/appwrite_controller.dart';

class ClientController extends GetxController {
  Client client = Client();

  @override
  void onInit() {
    super.onInit();
    cloud();
  }

  void cloud() {
    client
        .setEndpoint(AppwriteController.endPoint)
        .setProject(AppwriteController.projectID)
        .setSelfSigned(status: true);
  }
}
