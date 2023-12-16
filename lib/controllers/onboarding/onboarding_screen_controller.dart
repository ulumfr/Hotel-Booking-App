import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/models/onboarding/onboarding_model.dart';

class OnboardingScreenController extends GetxController {
  var currentIndex = 0.obs;
  final pageController = PageController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  RxList<OnBoardingContent> onboardingData = <OnBoardingContent>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchOnboardingData();
  }

  Future<void> fetchOnboardingData() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('onboarding').get();

    onboardingData.assignAll(await Future.wait(snapshot.docs.map((doc) async {
      String image1Url = await getDownloadUrl(doc['image1']);
      String image2Url = await getDownloadUrl(doc['image2']);
      return OnBoardingContent(
        image1: image1Url,
        image2: image2Url,
        text: doc['text'] ?? '',
        dsc: doc['dsc'] ?? '',
      );
    }).toList()));
  }

  Future<String> getDownloadUrl(String gsUrl) async {
    var ref = FirebaseStorage.instance.refFromURL(gsUrl);
    var url = await ref.getDownloadURL();
    return url;
  }

  void ganti(int index) {
    currentIndex.value = index;
  }

  void skipToAuthScreen() {
    Get.offAndToNamed('/auth');
  }
}
