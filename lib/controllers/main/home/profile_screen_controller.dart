import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/controllers/auth/appwrite/auth_appwrite_controller.dart';
import 'package:hotel_booking_app/models/auth/user_model.dart';

class ProfileScreenController extends GetxController {
  RxBool isEditing = false.obs;

  void toggleEditing() {
    isEditing.value = !isEditing.value;
    // controller.updateData();
    update();
  }

  @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   final Users user = Get.arguments as Users;
  //   AuthAppwriteController().getDoc(user.docId ?? "");
  //
  // }
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


}
