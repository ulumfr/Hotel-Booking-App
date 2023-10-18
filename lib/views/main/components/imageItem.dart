import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/main/image_controller.dart';
import 'package:image_picker/image_picker.dart';

class ImageItem extends StatefulWidget {
  const ImageItem({Key? key}) : super(key: key);

  @override
  _ImageItemState createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
  final ImageController controller = Get.find();

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          const Text(
            "Choose Profile photo",
            style: TextStyle(fontSize: 20.0, color: AppColors.blackColor),
          ),
          const SizedBox(
            height: 20,
          ),
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
                    controller.showSnackBar("Reset Successfully");
                  },
                  label: const Text("Reset"))
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: Stack(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: controller.imageFile.value == null
                  ? const AssetImage("assets/images/umm.jpg") as ImageProvider
                  : FileImage(File(controller.imageFile.value!.path)),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: ((builder) => bottomSheet()),
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
