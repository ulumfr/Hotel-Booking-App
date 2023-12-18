import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/controllers/main/home/imagepicker_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'imagepicker_controller_test.mocks.dart';

@GenerateMocks([ImagePicker])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ImagepickerController', () {
    late ImagepickerController imagepickerController;
    late MockImagePicker mockImagePicker;

    setUp(() {
      mockImagePicker = MockImagePicker();
      imagepickerController = ImagepickerController();
      imagepickerController.imagePicker = mockImagePicker;
    });
    test('takePhoto - success', () async {
      // Arrange
      when(mockImagePicker.pickImage(source: anyNamed('source')))
          .thenAnswer((_) async => XFile('assets/images/profile.png'));

      // Act
      await imagepickerController.takePhoto(ImageSource.camera);

      // Assert
      expect(imagepickerController.imageFile.value, isNotNull);
      verify(mockImagePicker.pickImage(source: ImageSource.camera)).called(1);
    });

    test('takePhoto - canceled', () async {
      // Arrange
      when(mockImagePicker.pickImage(source: anyNamed('source')))
          .thenAnswer((_) async => null);

      // Act
      await imagepickerController.takePhoto(ImageSource.camera);

      // Assert
      expect(imagepickerController.imageFile.value, isNull);
      verify(mockImagePicker.pickImage(source: ImageSource.camera)).called(1);
    });

    test('resetImage', () async {
      // Arrange
      imagepickerController.imageFile.value =
          XFile('assets/images/profile.png');

      // Act
      await imagepickerController.resetImage();

      // Assert
      expect(imagepickerController.imageFile.value, isNull);
    });
  });
}
