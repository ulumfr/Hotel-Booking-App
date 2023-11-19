import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel_booking_app/controllers/auth/user_controller.dart';
import 'package:hotel_booking_app/views/auth/screen/forgot_pass_screen.dart';
// import 'package:hotel_booking_app/views/auth/screen/login_screen.dart';
// import 'package:hotel_booking_app/views/main/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GoogleSignIn google = GoogleSignIn();
  final EmailOTP emailOTP = EmailOTP();
  final userController = Get.put(UserController());

  late Rx<User?> _user;
  late final SharedPreferences prefs = Get.find<SharedPreferences>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    // ever(_user, _initialScreen);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // _initialScreen(User? user){
  //   if(user == null){
  //     debugPrint("Login");
  //     Get.offAll(() => const LoginScreen());
  //   } else {
  //     Get.offAll(() => const MainScreen());
  //   }
  // }

  Future<void> registerUser(String email, String password) async {
    try {
      isLoading.value = true;
      await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      final user = userController.addUser(
        auth.currentUser!.uid,
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
        snackPosition: SnackPosition.BOTTOM,
      );
      goLogin();
    } catch (error) {
      Get.snackbar(
        'Error',
        'Registration Failed: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
        snackPosition: SnackPosition.BOTTOM,
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
        'Login successful',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
        snackPosition: SnackPosition.BOTTOM,
      );
      goMain();
    } catch (error) {
      Get.snackbar(
        'Error',
        'Login Failed: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
        snackPosition: SnackPosition.BOTTOM,
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
      }
    } catch (error) {
      Get.snackbar(
        'Error',
        'Login Failed: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> isEmailRegistered(String email) async {
    try {
      debugPrint("email: $email");
      QuerySnapshot query = await firestore
          .collection('Users')
          .where('email', isEqualTo: email)
          .get();
      debugPrint("email: $email");
      if (query.docs.isEmpty) {
        return false;
      } else {
        return true;
      }
    } catch (error) {
      debugPrint('Error checking email registration: $error');
      return false;
    }
  }

  Future<bool> sendOTP(String email, password) async {
    try {
      if (!await isEmailRegistered(email)) {
        await emailOTP.setConfig(
            appEmail: "sampurna@gmail.com",
            appName: "Hotel Booking",
            userEmail: email,
            otpLength: 4,
            otpType: OTPType.digitsOnly);
        debugPrint("sukses");
        prefs.setString('email', email);
        prefs.setString('password', password);
        if (await emailOTP.sendOTP() == true) {
          Get.snackbar("Registration", "OTP has been sent");
          Get.to(() => const ForgotPassScreen());
          return true;
        } else {
          throw Exception('Failed to send OTP');
        }
      } else {
        Get.snackbar('Error', 'Email is Registered');
        return false;
      }
    } catch (error) {
      debugPrint("$error");
      return false;
    }
  }

  void verifyOTP(String otp) async {
    if (await emailOTP.verifyOTP(otp: otp) == true) {
      registerUser(prefs.getString('email')!, prefs.getString('password')!);
      prefs.remove('email');
      prefs.remove('password');
    }
  }

  void logout() async {
    isLoading.value = true;
    // prefs.remove('user_token');
    await auth.signOut();
    if (await google.isSignedIn()) {
      await google.signOut();
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
  }
}
