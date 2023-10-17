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
              height: 50,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(15)),
                  ),
                  hintText: 'What are you looking for',
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: AppColors.gray4Color,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Ink(
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(15),
                  ),
                ),
                child: const Icon(
                  Icons.filter_alt_sharp,
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
