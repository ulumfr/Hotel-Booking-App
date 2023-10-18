import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  Rx<XFile?> imageFile = Rx<XFile?>(null);

  void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.only(left: 50, bottom: 25, top: 25),
        content: Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {},
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      imageFile.value = pickedFile;
      showSnackBar("Profile picture changed successfully!");
    }
  }

  void resetImage() {
    imageFile.value = null;
  }
}
