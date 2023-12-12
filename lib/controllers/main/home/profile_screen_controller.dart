import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  RxBool isEditing = false.obs;

  void toggleEditing() {
    isEditing.value = !isEditing.value;
    // controller.updateData();
    update();
  }

  // @override
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
