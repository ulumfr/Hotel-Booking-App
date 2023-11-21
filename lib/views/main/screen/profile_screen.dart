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
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
              top: 50,
            ),
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 130,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(17),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/background-profile.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: -35,
                      child: SizedBox(
                        width: 90,
                        height: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(
                            image: AssetImage('assets/images/profile.png'),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 60,
                      child: Text(
                        "Bahrul Ulum",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 23,
                          letterSpacing: 1.3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
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
