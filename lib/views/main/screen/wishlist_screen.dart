import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/main/home/home_screen_controller.dart';
import 'package:hotel_booking_app/views/main/components/horizontal_card_item.dart';
import 'package:hotel_booking_app/views/main/components/search_textfield.dart';
import 'package:hotel_booking_app/views/main/components/text_main.dart';
import 'package:hotel_booking_app/views/main/components/text_seeall.dart';

class WishlistScreen extends GetView<HomeScreenController> {
  const WishlistScreen({Key? key}) : super(key: key);

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
                      "Wish List",
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SearchTextfield(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextMain(labelText: "Favourite Countries"),
                      InkWell(
                        onTap: () {},
                        child: Ink(child: const TextSeeall()),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: Obx(
                    () {
                      if (controller.hotelsHorizontal.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.builder(
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => HorizontalCardItem(
                            horizontalCard: controller.hotelsHorizontal[index],
                          ),
                          itemCount: controller.hotelsHorizontal.length,
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextMain(labelText: "Favourite City"),
                      InkWell(
                        onTap: () {},
                        child: Ink(child: const TextSeeall()),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: Obx(
                    () {
                      if (controller.hotelsHorizontal.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.builder(
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => HorizontalCardItem(
                            horizontalCard: controller.hotelsHorizontal[index],
                          ),
                          itemCount: controller.hotelsHorizontal.length,
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
