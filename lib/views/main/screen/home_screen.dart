import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/main/image_controller.dart';
import 'package:hotel_booking_app/views/main/components/imageItem.dart';
import 'package:hotel_booking_app/views/main/components/search_textfield.dart';
import 'package:hotel_booking_app/models/main/horizontal_card_model.dart';
import 'package:hotel_booking_app/models/main/vertical_card_model.dart';
import 'package:hotel_booking_app/views/main/components/horizontal_card_item.dart';
import 'package:hotel_booking_app/views/main/components/vertical_card_item.dart';

class HomeScreen extends GetView<ImageController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ImageController());
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 15,
          ),
          child: Column(
            children: [
              // AppBar =======
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const InkWell(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: ImageItem(),
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
                            SizedBox(
                              width: 4,
                            ),
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
                        icon: const Icon(
                          Icons.notifications,
                        ),
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
              // AppBar =======

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
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //Search Input
              const SearchTextfield(),
              //Search Input

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Ink(
                        child: const Text(
                          'See All',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // list Popular
              SizedBox(
                height: 220,
                width: double.infinity,
                child: ListView.separated(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => HorizontalCardItem(
                    name: popularHotels[index].name,
                    location: popularHotels[index].location,
                    photo: popularHotels[index].photo,
                    price: popularHotels[index].price,
                    rating: popularHotels[index].rating,
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: popularHotels.length,
                ),
              ),
              // list Popular

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Nearby Location',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Ink(
                        child: const Text(
                          'See All',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //List Nearby Location
              SizedBox(
                width: double.infinity,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => VerticalCardItem(
                    name: nearbyHotels[index].name,
                    location: nearbyHotels[index].location,
                    photo: nearbyHotels[index].photo,
                    price: nearbyHotels[index].price,
                    rating: nearbyHotels[index].rating,
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: nearbyHotels.length,
                ),
              ),
              //List Nearby Location
            ],
          ),
        ),
      ),
    );
  }
}
