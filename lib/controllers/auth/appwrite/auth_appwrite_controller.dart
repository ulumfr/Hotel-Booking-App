import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/auth/appwrite/client_controller.dart';

class AuthAppwriteController extends ClientController {
  Account? account;
  late User _currentUser;

  User get currentUser => _currentUser;
  String? get username => _currentUser.name;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();

  bool isSecure = true;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    account = Account(client);
  }

  Future createAccount(Map map) async {
    try {
      await account!.create(
        userId: map['userId'],
        email: map['email'],
        password: map['password'],
        name: map['name'],
      );
      Get.snackbar(
        'Success',
        'Registration Successful',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
      );
    } catch (error) {
      Get.defaultDialog(
        title: "Error Account",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future createEmailSession(Map map) async {
    try {
      await account!.createEmailSession(
        email: map['email'],
        password: map['password'],
      );
      Get.snackbar(
        'Success',
        'Login Successful',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
      );
    } catch (error) {
      Get.defaultDialog(
        title: "Error Account",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  void signup() {
    try {
      if (passwordController.text == confPasswordController.text) {
        createAccount({
          'userId': ID.unique(),
          'email': emailController.text,
          'password': passwordController.text,
          'name': nameController.text,
        });
        goLogin();
      } else {
        print('Password and confirm password do not match');
      }
    } catch (error) {
      Get.snackbar(
        'Error',
        'Register Failed: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
      );
    }
  }

  void login() {
    try {
      createEmailSession({
        'email': emailController.text,
        'password': passwordController.text,
      }).then((result) async {
        if (account != null) {
          _currentUser = await account!.get();
          goMain();
        } else {
          print('Account is null');
        }
      }).catchError((error) {
        Get.defaultDialog(
          title: "Error Account",
        );
      });
    } catch (error) {
      Get.snackbar(
        'Error',
        'Login Failed: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
      );
    }
  }

  Future<void> logout() async {
    try {
      isLoading.value = true;
      account?.deleteSession(sessionId: 'current');
      Get.snackbar(
        'Succes',
        'Logout Successful',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
      );
      goLogin();
    } catch (error) {
      Get.snackbar(
        'Error',
        'Logout Failed: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // void logout() async {
  //   try {
  //     isLoading.value = true;
  //     Get.snackbar(
  //       'Succes',
  //       'Logout Successful',
  //       backgroundColor: AppColors.primaryColor,
  //       colorText: AppColors.whiteColor,
  //     );
  //     goLogin();
  //   } catch (error) {
  //     Get.snackbar(
  //       'Error',
  //       'Logout Failed: $error',
  //       backgroundColor: AppColors.secondaryColor,
  //       colorText: AppColors.whiteColor,
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  void goLogin() {
    clear();
    Get.toNamed('/loginAppwrite');
  }

  void goSignup() {
    clear();
    Get.toNamed('/signupAppwrite');
  }

  void goForgot() {
    Get.toNamed('/forgotAppwrite');
  }

  void goVerify() {
    Get.toNamed('/verifyAppwrite');
  }

  void goResetPass() {
    Get.toNamed('/resetAppwrite');
  }

  void goMain() {
    clear();
    Get.offAndToNamed('/main');
  }

  void clear() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confPasswordController.clear();
  }
}
