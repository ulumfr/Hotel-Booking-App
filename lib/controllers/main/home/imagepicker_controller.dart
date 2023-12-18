import 'package:get/get.dart';
import 'package:hotel_booking_app/views/main/components/home/imgpicker/snackbar_image.dart';
import 'package:image_picker/image_picker.dart';

class ImagepickerController extends GetxController {
  
  ImagepickerController() : _imagePicker = ImagePicker();
  set imagePicker(ImagePicker value) => _imagePicker = value;
  late ImagePicker _imagePicker;
  Rx<XFile?> imageFile = Rx<XFile?>(null);

  Future<void> takePhoto(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      imageFile.value = pickedFile;
      if (Get.context != null) {
        MySnackBarImg.show(Get.context!, "Profile Picture Updated");
      }
    }
  }

  Future<void> resetImage() async {
    imageFile.value = null;
    if (Get.context != null) {
      MySnackBarImg.show(Get.context!, "Reset Successfully");
    }
  }
}
