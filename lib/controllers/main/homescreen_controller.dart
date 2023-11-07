import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/views/main/screen/auth_controller.dart';

class HomeScreenController extends GetxController {
  late AuthController user;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    user = AuthController.instance;
    super.onInit();
  }

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference details = firestore.collection("hotel_details");
    return details.get();
  }
}