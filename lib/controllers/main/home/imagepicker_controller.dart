import 'package:get/get.dart';
import 'package:hotel_booking_app/views/main/components/home/imgpicker/snackbar_image.dart';
import 'package:image_picker/image_picker.dart';

class ImagepickerController extends GetxController {
  Rx<XFile?> imageFile = Rx<XFile?>(null);

  void takePhoto(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      imageFile.value = pickedFile;
      MySnackBarImg.show(Get.context!, "Profile Picture Updated");
    }
  }

  void resetImage() {
    imageFile.value = null;
    MySnackBarImg.show(Get.context!, "Reset Successfully");
  }
}