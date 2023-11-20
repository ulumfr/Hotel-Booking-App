import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel_booking_app/controllers/auth/user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GoogleSignIn google = GoogleSignIn();

  late Rx<User?> _user;
  final userController = Get.put(UserController());
  late final SharedPreferences prefs = Get.find<SharedPreferences>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();

  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  _initialScreen(User? user) {
    if (user == null) {
      debugPrint("Login");
      Get.offAndToNamed('/welcome');
      // Get.offAll(() => const LoginScreen());
    } else {
      Get.offAndToNamed('/main');
      // Get.offAll(() => const MainScreen());
    }
  }

  Future<void> registerUser({
    String? username,
    required String email,
    required String password,
    required String confPassword,
  }) async {
    try {
      isLoading.value = true;
      await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      final user = userController.addUser(
        auth.currentUser!.uid,
        username,
        email,
        password,
      );
      userController.createUser(user);
      prefs.setString('user_token', auth.currentUser!.uid);
      Get.snackbar(
        'Success',
        'Registration Successful',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
        snackPosition: SnackPosition.TOP,
      );
      goLogin();
    } catch (error) {
      Get.snackbar(
        'Error',
        'Registration Failed: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      prefs.setString('user_token', auth.currentUser!.uid);
      Get.snackbar(
        'Success',
        'Login Successful',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
        snackPosition: SnackPosition.TOP,
      );
      goMain();
    } catch (error) {
      Get.snackbar(
        'Error',
        'Login Failed: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void googleLogin() async {
    try {
      isLoading.value = true;
      final GoogleSignInAccount? googleSignInAccount = await google.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth.signInWithCredential(credential);
        prefs.setString('user_token', auth.currentUser!.uid);
        Get.snackbar(
          'Succes',
          'Login With Google Successful',
          backgroundColor: AppColors.primaryColor,
          colorText: AppColors.whiteColor,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (error) {
      Get.snackbar(
        'Error',
        'Login Failed: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    try {
      isLoading.value = true;
      prefs.remove('user_token');
      await auth.signOut();
      if (await google.isSignedIn()) {
        await google.signOut();
      }
      Get.snackbar(
        'Succes',
        'Logout Successful',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
        snackPosition: SnackPosition.TOP,
      );
    } catch (error) {
      Get.snackbar(
        'Error',
        'Logout Failed: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void goLogin() {
    clear();
    Get.toNamed('/login');
  }

  void goSignup() {
    Get.toNamed('/signup');
  }

  void goForgot() {
    Get.toNamed('/forgot');
  }

  void goVerify() {
    Get.toNamed('/verify');
  }

  void goResetPass() {
    Get.toNamed('/reset');
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
