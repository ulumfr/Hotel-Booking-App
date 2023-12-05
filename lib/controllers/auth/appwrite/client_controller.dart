import 'package:appwrite/appwrite.dart';

import 'package:get/get.dart';

class ClientController extends GetxController {
  Client client = Client();

  @override
  void onInit() {
    super.onInit();

    const endPoint = "https://cloud.appwrite.io/v1";
    const projectID = "653e21c16e7ec2b72c76";
    client
        .setEndpoint(endPoint)
        .setProject(projectID)
        .setSelfSigned(status: true);
  }
}
