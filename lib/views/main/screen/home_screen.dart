import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/main/home/home_screen_controller.dart';
import 'package:hotel_booking_app/views/main/components/home/imgpicker/imagepicker_item.dart';
import 'package:hotel_booking_app/views/main/components/search_textfield.dart';
import 'package:hotel_booking_app/views/main/components/horizontal_card_item.dart';
import 'package:hotel_booking_app/views/main/components/text_main.dart';
import 'package:hotel_booking_app/views/main/components/text_seeall.dart';
import 'package:hotel_booking_app/views/main/components/vertical_card_item.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const InkWell(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: ImagepickerItem(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Text(
                            'Welcome, Ulum',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 15,
                              color: AppColors.secondaryColor,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Jawa',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        iconSize: 33,
                        icon: const Icon(Icons.notifications),
                        color: AppColors.primaryColor,
                      ),
                      Positioned(
                        top: 12,
                        right: 13,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: RichText(
                    text: const TextSpan(
                      text: 'Find Your Perfect ',
                      style: TextStyle(
                        fontSize: 25,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w800,
                      ),
                      children: [
                        TextSpan(
                          text: 'Hotel',
                          style: TextStyle(
                            fontSize: 25,
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SearchTextfield(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextMain(labelText: "Popular"),
                    InkWell(
                      onTap: () {
                        controller.goWebviewPopular();
                      },
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
                  vertical: 18,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextMain(labelText: "Nearby Location"),
                    InkWell(
                      onTap: () {
                        controller.goWebviewNearby();
                      },
                      child: Ink(child: const TextSeeall()),
                    ),
                  ],
                ),
              ),
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
