import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/main/home/imagepicker_controller.dart';
import 'package:hotel_booking_app/views/main/components/home/imgpicker/bottomsheet_image.dart';

class ImagepickerItem extends GetView<ImagepickerController> {
  const ImagepickerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: controller.imageFile.value == null
                ? const AssetImage("assets/images/profile.png") as ImageProvider
                : FileImage(File(controller.imageFile.value!.path)),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => const BottomsheetImage()),
                  backgroundColor: AppColors.whiteColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
