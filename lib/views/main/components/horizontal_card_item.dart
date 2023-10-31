import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/models/main/horizontal_card_model.dart';
import 'package:hotel_booking_app/views/main/components/rating.dart';

class HorizontalCardItem extends StatelessWidget {
  const HorizontalCardItem({
    Key? key,
    required this.horizontalCard,
    required this.name,
    required this.location,
    required this.price,
    required this.rating
  }) : super(key: key);

  final HotelHorizontalCard horizontalCard;
  final String name;
  final String location;
  final String price;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 220,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.gray1Color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 222, 222, 224),
            blurRadius: 8,
            spreadRadius: 0.3,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(horizontalCard.photo,
                        fit: BoxFit.fitHeight),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_outline_rounded,
                        color: AppColors.secondaryColor,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          SizedBox(
            width: double.infinity,
            child: Text(
              name,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 17,
                  color: AppColors.secondaryColor,
                ),
                const SizedBox(width: 2),
                Text(
                  location,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: AppColors.gray3Color,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Rating(ratingTotal: double.parse(rating)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: RichText(
                    text: TextSpan(
                      text: '${price}\$/',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w800,
                        overflow: TextOverflow.ellipsis,
                      ),
                      children: const [
                        TextSpan(
                          text: 'night',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.gray3Color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
