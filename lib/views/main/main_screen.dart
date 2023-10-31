import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/main/main_screen_controller.dart';
import 'package:hotel_booking_app/views/main/screen/booking_screen.dart';
import 'package:hotel_booking_app/views/main/screen/home_screen.dart';
import 'package:hotel_booking_app/views/main/screen/profile_screen.dart';
import 'package:hotel_booking_app/views/main/screen/wishlist_screen.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidgetMain = [
      const HomeScreen(),
      const BookingScreen(),
      const WishlistScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: Obx(() => listWidgetMain[controller.indexMainScreen.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            currentIndex: controller.indexMainScreen.value,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.gray3Color,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: 'Book',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_rounded),
                label: 'Wish List',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_rounded),
                label: 'Profile',
              )
            ],
            onTap: (index) {
              controller.indexMainScreen.value = index;
            }),
      ),
    );
  }
}
