import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel_booking_app/controllers/auth/firebase/user_firebase_controller.dart';
import 'package:hotel_booking_app/controllers/notification/notification_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthFirebaseController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GoogleSignIn google = GoogleSignIn();
  final notification = Get.put(FirebaseMessagingHandler());

  late Rx<User?> _user;
  final userController = Get.put(UserFirebaseController());
  late final SharedPreferences prefs = Get.find<SharedPreferences>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();

  RxBool isLoading = false.obs;
  bool isSecure = true;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  void clickNotification() {
    notification.subscribe();
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
    } else {
      Get.offAndToNamed('/main');
    }
  }

  Future<void> registerUserFirebase ({
    String? username,
    required String email,
    required String password,
    required String confPassword,
  }) async {
    try {
      isLoading.value = true;
      if (password != confPassword) {
        throw 'Password and Confirm Password must match';
      }
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
      // await auth.currentUser!.updateDisplayName(username);
      prefs.setString('user_token', auth.currentUser!.uid);
      Get.snackbar(
        'Success',
        'Registration Successful',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
      );
      // await Future.delayed(const Duration(seconds: 2)); // Ganti dengan durasi yang sesuai
      goLogin();
      
    } catch (error) {
      String errorMessage = 'Registration Failed';

      if (error is FirebaseAuthException) {
        switch (error.code) {
          case 'invalid-password':
            errorMessage = 'Password should be at least 6 characters long';
            break;
          case 'email-already-exists':
            errorMessage = 'The email is already in use by another account.';
            break;
          case 'invalid-email':
            errorMessage = 'The email address is not valid.';
            break;
          default:
            errorMessage = '${error.message}';
        }
      } else if (error is String) {
        errorMessage = error; 
      }
      Get.snackbar(
        'Error',
        errorMessage,
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginUserFirebase(String email, String password) async {
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
      );
      goMain();
    } catch (error) {
      Get.snackbar(
        'Error',
        'Login Failed: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
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
        );
      }
    } catch (error) {
      Get.snackbar(
        'Error',
        'Login Failed: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void logoutFirebase() async {
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
      );
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

  void goLogin() {
    clear();
    Get.toNamed('/loginFirebase');
  }

  void goSignup() {
    Get.toNamed('/signupFirebase');
  }

  void goForgot() {
    Get.toNamed('/forgotFirebase');
  }

  void goVerify() {
    Get.toNamed('/verifyFirebase');
  }

  void goResetPass() {
    Get.toNamed('/resetFirebase');
  }

  void goMain() {
    clear();
    Get.offAndToNamed('/main');
  }

  void goEdit() {
    Get.toNamed('/editProfile');
  }

  void clear() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confPasswordController.clear();
  }
}
