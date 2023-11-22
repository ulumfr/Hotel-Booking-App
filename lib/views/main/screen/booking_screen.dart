import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constants.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.gray1Color,
      body: Center(
        child: Text("Booking (SOON!)"),
      ),
    );
  }
}
