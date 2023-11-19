import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel_booking_app/views/main/screen/otp_screen.dart';
import 'package:hotel_booking_app/views/main/screen/signup.dart';
import 'package:hotel_booking_app/views/main/screen/test_page.dart';
import 'package:hotel_booking_app/views/main/screen/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  // const AuthController({super.key});
  static AuthController instance = Get.find();
  late Rx<User?> _user; //store user info
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final EmailOTP otpAuth = EmailOTP();
  final userRepo = Get.put(UserRepository());
  late final SharedPreferences _prefs = Get.find<SharedPreferences>();

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser); //type casting
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen); //listener if user not null
  }

  _initialScreen(User? user){
    if(user == null){
      print("Login");
      Get.offAll(() => const SignUp());
    } else {
      Get.offAll(() => Testing(email: user.email!));
    }
  }

  Future<bool> sendOTP(String email, password) async {
    try{
      if(!await isEmailRegistered(email)){
        await otpAuth.setConfig(
            appEmail: "sampurna@gmail.com",
            appName: "Hotel Booking",
            userEmail: email,
            otpLength: 4,
            otpType: OTPType.digitsOnly
        );
        print("sukses");
        _prefs.setString('email', email);
        _prefs.setString('password', password);
        if(await otpAuth.sendOTP() == true){
          Get.snackbar("Registration", "OTP has been sent");
          Get.to(() => OTPScreen());
          return true;
        }else {
          throw Exception('Failed to send OTP');
        }
      }else{
        Get.snackbar('Error', 'Email is Registered');
        return false;
      }
    }catch(e){
      print(e);
      return false;
    }
  }

  void verifyOTP(String otp) async {
    if(await otpAuth.verifyOTP(otp: otp) == true){
      register(_prefs.getString('email')!, _prefs.getString('password')!);
      _prefs.remove('email');
      _prefs.remove('password');
    }
  }

  void register(String email,password) async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      final user = userRepo.addUser(auth.currentUser!.uid, email, password);
      userRepo.createUser(user);
      _prefs.setString('user_token', auth.currentUser!.uid);
    }catch(e){
      Get.snackbar("About User", "User message",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.lightBlueAccent,
      titleText: const Text("Account creation failed",
      style: TextStyle(
        color: Colors.white
      )),
      messageText: Text(e.toString(),
          style: const TextStyle(
              color: Colors.white
          )));
    }
  }
  void login(String email,password) async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      _prefs.setString('user_token', auth.currentUser!.uid);
    }catch(e){
      Get.snackbar("About Login", "Login message",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.lightBlueAccent,
          titleText: const Text("Account login failed",
              style: TextStyle(
                  color: Colors.white
              )),
          messageText: Text(e.toString(),
              style: const TextStyle(
                  color: Colors.white
              )));
    }
  }

  void gLogin() async {
    try{
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth.signInWithCredential(credential);
        _prefs.setString('user_token', auth.currentUser!.uid);
      }

    }catch(e){
      Get.snackbar("About Login", "Login message",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.lightBlueAccent,
          titleText: const Text("Account login failed",
              style: TextStyle(
                  color: Colors.white
              )),
          messageText: Text(e.toString(),
              style: const TextStyle(
                  color: Colors.white
              )));
    }
  }

  Future<bool> isEmailRegistered(String email) async {
    try {
      print("email: $email");
      QuerySnapshot query = await firestore.collection('Users').where('email', isEqualTo: email).get();
      print("email: $email");
      // If the list of signInMethods is not empty, the email is registered
      if (query.docs.isEmpty){
        return false;
      }
      else {
        return true;
      }
    } catch (e) {
      // Handle any potential errors here
      print('Error checking email registration: $e');
      return false;
    }
  }

  void logOut() async {
    _prefs.remove('user_token');
    auth.signOut();
    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.signOut();
    }
  }

}
