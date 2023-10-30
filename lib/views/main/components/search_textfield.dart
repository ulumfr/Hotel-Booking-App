import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constants.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SizedBox(
              height: 46,
              child: TextFormField(
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(15),
                    ),
                    borderSide: BorderSide(color: AppColors.gray3Color),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(15),
                    ),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  hintText: 'What are you looking for',
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: AppColors.gray3Color,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.gray3Color,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Ink(
              child: Container(
                width: 44,
                height: 46,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(15),
                  ),
                ),
                child: const Icon(
                  Icons.tune_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
