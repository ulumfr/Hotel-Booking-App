import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/onboarding/onboarding_screen_controller.dart';
import 'package:hotel_booking_app/models/onboarding/onboarding_model.dart';
import 'package:hotel_booking_app/views/onboarding/components/titik_geser.dart';

class OnboardingScreen extends GetView<OnboardingScreenController> {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingScreenController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              controller.skipToMainScreen();
            },
            child: const Text(
              'skip',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 17,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: geser.length,
                  onPageChanged: controller.ganti,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            width: MediaQuery.sizeOf(context).width,
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width *
                                      (50 / 100),
                                  height: 245,
                                  margin: const EdgeInsets.only(
                                    left: 150,
                                    top: 90,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(10),
                                      bottom: Radius.circular(100),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(geser[i].image1),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width *
                                      (50 / 100),
                                  height: 245,
                                  margin: const EdgeInsets.only(
                                    right: 150,
                                    bottom: 90,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(10),
                                      top: Radius.circular(100),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(geser[i].image2),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              geser.length,
                              (index) => TitikGeser(index: index),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 7, top: 25),
                            child: Text(
                              geser[i].text,
                              style: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              geser[i].dsc,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(
                  bottom: 73,
                  right: 20,
                  left: 20,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20),
                    right: Radius.circular(20),
                  ),
                ),
                child: TextButton(
                  child: Text(
                    controller.currentIndex.value == geser.length - 1
                        ? 'Continue'
                        : 'Next',
                    style: const TextStyle(
                      color: AppColors.gray1Color,
                      fontSize: 27,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {
                    if (controller.currentIndex.value == geser.length - 1) {
                      controller.skipToMainScreen();
                    } else {
                      controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceIn,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
