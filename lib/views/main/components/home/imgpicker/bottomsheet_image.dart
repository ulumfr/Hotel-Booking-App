import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/main/home/imagepicker_controller.dart';
import 'package:image_picker/image_picker.dart';

class BottomsheetImage extends GetView<ImagepickerController> {
  const BottomsheetImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.camera),
                onPressed: () {
                  controller.takePhoto(ImageSource.camera);
                  Navigator.pop(context);
                },
                label: const Text("Camera"),
              ),
              const SizedBox(width: 20),
              TextButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () {
                  controller.takePhoto(ImageSource.gallery);
                  Navigator.pop(context);
                },
                label: const Text("Gallery"),
              ),
              const SizedBox(width: 20),
              TextButton.icon(
                icon: const Icon(Icons.restart_alt),
                onPressed: () {
                  controller.resetImage();
                  Navigator.pop(context);
                },
                label: const Text("Reset"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
