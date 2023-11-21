import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constants.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: AppColors.gray2Color, width: 2),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.primaryColor,
            ),
            const SizedBox(width: 20),
            Text(
              text,
              style: const TextStyle(
                color: AppColors.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
