import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/main/home/home_screen_controller.dart';
import 'package:hotel_booking_app/views/main/components/search_textfield.dart';
import 'package:hotel_booking_app/views/main/components/vertical_card_item.dart';

class BookingScreen extends GetView<HomeScreenController> {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 15,
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 30),
                  child: Center(
                    child: Text(
                      "Booking",
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SearchTextfield(),
                const SizedBox(height: 25),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "New",
                        style: TextStyle(
                          color: AppColors.gray3Color,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 18),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Recent",
                        style: TextStyle(
                          color: AppColors.gray3Color,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 18),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Canceled",
                        style: TextStyle(
                          color: AppColors.gray3Color,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () {
                      if (controller.hotelsVertical.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => VerticalCardItem(
                            verticalCard: controller.hotelsVertical[index],
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: controller.hotelsVertical.length,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
