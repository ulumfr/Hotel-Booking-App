import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel_booking_app/views/main/screen/signup.dart';
import 'package:hotel_booking_app/views/main/screen/test_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  // const AuthController({super.key});
  static AuthController instance = Get.find();
  late Rx<User?> _user; //store user info
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final SharedPreferences _prefs = Get.find<SharedPreferences>();

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
      Get.offAll(() => SignUp());
    } else {
      Get.offAll(() => Testing(email: user.email!));
    }
  }

  void register(String email,password) async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
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
  void logOut() async {
    _prefs.remove('user_token');
    auth.signOut();
    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.signOut();
    }
  }

}
