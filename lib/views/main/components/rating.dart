import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constants.dart';

class Rating extends StatelessWidget {
  const Rating({Key? key, required this.ratingTotal}) : super(key: key);

  final double ratingTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (ratingTotal >= 1)
          const Icon(
            Icons.star,
            size: 12,
            color: AppColors.starColor,
          ),
        if (ratingTotal >= 2)
          const Icon(
            Icons.star,
            size: 12,
            color: AppColors.starColor,
          ),
        if (ratingTotal >= 3)
          const Icon(
            Icons.star,
            size: 12,
            color: AppColors.starColor,
          ),
        if (ratingTotal >= 4)
          const Icon(
            Icons.star,
            size: 12,
            color: AppColors.starColor,
          ),
        if (ratingTotal >= 5)
          const Icon(
            Icons.star,
            size: 12,
            color: AppColors.starColor,
          ),
        const SizedBox(width: 2),
        Text(
          ratingTotal <= 5 ? ratingTotal.toString() : '5.0',
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 12,
              fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
