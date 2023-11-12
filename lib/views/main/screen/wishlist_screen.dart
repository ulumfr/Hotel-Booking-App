import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/main/home/home_screen_controller.dart';
import 'package:hotel_booking_app/models/main/horizontal_card_model.dart';
import 'package:hotel_booking_app/views/main/components/horizontal_card_item.dart';
import 'package:hotel_booking_app/views/main/components/search_textfield.dart';
import 'package:hotel_booking_app/views/main/components/text_main.dart';
import 'package:hotel_booking_app/views/main/components/text_seeall.dart';

class WishlistScreen extends GetView<HomeScreenController> {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: const BackButton(
          color: AppColors.blackColor,
        ),
        title: const Text(
          "Wish List",
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
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
                  child: FutureBuilder<QuerySnapshot<Object?>>(
                    future: controller.getData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        var listDocs = snapshot.data!.docs;
                        return ListView.separated(
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => HorizontalCardItem(
                            horizontalCard: HotelHorizontalCard.fromMap(
                              listDocs[index].data() as Map<String, dynamic>,
                            ),
                            photoHorizontal: popularHotels[index],
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                          itemCount: listDocs.length,
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
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
                  child: FutureBuilder<QuerySnapshot<Object?>>(
                    future: controller.getData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        var listDocs = snapshot.data!.docs;
                        return ListView.separated(
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => HorizontalCardItem(
                            horizontalCard: HotelHorizontalCard.fromMap(
                              listDocs[index].data() as Map<String, dynamic>,
                            ),
                            photoHorizontal: popularHotels[index],
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                          itemCount: listDocs.length,
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
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
