// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/auth/appwrite/auth_appwrite_controller.dart';
import 'package:hotel_booking_app/controllers/auth/firebase/auth_firebase_controller.dart';
import 'package:hotel_booking_app/views/main/components/profile/profile_list_item.dart';

// AuthFirebaseController sementara di nonaktifkan
class ProfileScreen extends GetView<AuthFirebaseController> {
  ProfileScreen({Key? key}) : super(key: key);

  // final isloginUser = FirebaseAuth.instance.currentUser!;

  final AuthAppwriteController authAppwriteController =
      Get.find<AuthAppwriteController>();

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
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              "Profile",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.settings,
                              color: AppColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                      ),
                      child: Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.center,
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(17),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      "assets/images/background-profile.jpg",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -35,
                                child: SizedBox(
                                  width: 85,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: const Image(
                                      image: AssetImage(
                                        "assets/images/profile.png",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 65,
                                child: Text(
                                  // '${isloginUser.displayName ?? isloginUser.email}',
                                  '${authAppwriteController.userdat[0].username}',
                                  style: const TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 23,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          ProfileListItem(
                            onTap: () {
                              authAppwriteController.goEdit();
                            },
                            icon: Icons.edit,
                            text: "Edit Profile",
                          ),
                          const SizedBox(height: 20),
                          ProfileListItem(
                            onTap: () {
                              // controller.clickNotification();
                            },
                            icon: Icons.notifications,
                            text: "Notification",
                          ),
                          const SizedBox(height: 20),
                          ProfileListItem(
                            onTap: () {},
                            icon: Icons.toggle_on_outlined,
                            text: "Dark Mode",
                          ),
                          const SizedBox(height: 20),
                          ProfileListItem(
                            onTap: () {},
                            icon: Icons.card_giftcard,
                            text: "Voucher",
                          ),
                          const SizedBox(height: 20),
                          ProfileListItem(
                            onTap: () {},
                            icon: Icons.credit_card,
                            text: "Cards and Payment",
                          ),
                          const SizedBox(height: 20),
                          ProfileListItem(
                            onTap: () {},
                            icon: Icons.headset_mic,
                            text: "Customer Service",
                          ),
                          const SizedBox(height: 20),
                          ProfileListItem(
                            onTap: () {
                              authAppwriteController.logout();
                            },
                            icon: Icons.exit_to_app,
                            text: "Logout",
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
