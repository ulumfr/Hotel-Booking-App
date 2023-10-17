import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/views/main/components/rating.dart';

class VerticalCardItem extends StatelessWidget {
  const VerticalCardItem({
    Key? key,
    required this.name,
    required this.location,
    required this.photo,
    required this.price,
    required this.rating,
  }) : super(key: key);

  final String name;
  final String location;
  final String photo;
  final String price;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 85,
      padding: const EdgeInsets.all(7),
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 75,
            height: 75,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                photo,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                name,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 15,
                                    color: AppColors.secondaryColor,
                                  ),
                                  Text(
                                    location,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Ink(
                          child: Container(
                            width: 25,
                            height: 25,
                            padding: const EdgeInsets.all(3),
                            child: const Icon(
                              Icons.bookmark_outline,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Rating(
                        ratingTotal: rating,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: RichText(
                          text: TextSpan(
                            text: '$price\$/',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis,
                            ),
                            children: const [
                              TextSpan(
                                text: 'night',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                  overflow: TextOverflow.ellipsis,
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
          ),
        ],
      ),
    );
  }
}
