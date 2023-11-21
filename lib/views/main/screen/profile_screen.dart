import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/auth/auth_controller.dart';
import 'package:hotel_booking_app/views/main/components/profile/profile_list_item.dart';

class ProfileScreen extends GetView<AuthController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        // leading: BackButton(
        //   color: AppColors.blackColor,
        //   onTap: () {},
        // ),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                const Text(
                  "Bahrul Ulum",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 25),
                ProfileListItem(
                  onTap: () {},
                  icon: Icons.edit,
                  text: "Edit Profile",
                ),
                const SizedBox(height: 25),
                ProfileListItem(
                  onTap: () {},
                  icon: Icons.notifications,
                  text: "Notification",
                ),
                const SizedBox(height: 25),
                ProfileListItem(
                  onTap: () {},
                  icon: Icons.toggle_on_outlined,
                  text: "Dark Mode",
                ),
                const SizedBox(height: 25),
                ProfileListItem(
                  onTap: () {},
                  icon: Icons.card_giftcard,
                  text: "Voucher",
                ),
                const SizedBox(height: 25),
                ProfileListItem(
                  onTap: () {},
                  icon: Icons.credit_card,
                  text: "Cards and Payment",
                ),
                const SizedBox(height: 25),
                ProfileListItem(
                  onTap: () {},
                  icon: Icons.headset_mic,
                  text: "Customer Service",
                ),
                const SizedBox(height: 25),
                ProfileListItem(
                  onTap: () {
                    controller.logout();
                  },
                  icon: Icons.exit_to_app,
                  text: "Logout",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
