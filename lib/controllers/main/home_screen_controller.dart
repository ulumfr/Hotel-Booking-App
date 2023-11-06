import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference details = firestore.collection("hotel_details");
    return details.get();
  }

  void goWebviewPopular() {
    Get.toNamed('/webpopular');
  }

  void goWebviewNearby() {
    Get.toNamed('/webnearby');
  }
}
