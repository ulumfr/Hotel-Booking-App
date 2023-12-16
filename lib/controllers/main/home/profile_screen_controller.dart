import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  RxBool isEditing = false.obs;

  void toggleEditing() {
    isEditing.value = !isEditing.value;
    // controller.updateData();
    update();
  }
  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}
