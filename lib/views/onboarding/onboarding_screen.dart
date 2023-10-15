import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/views/main/home_screen.dart';
import 'package:hotel_booking_app/models/onboarding/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              child: const Text(
                'skip',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 17,
                    decoration: TextDecoration.underline),
              ))
        ],
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: geser.length,
                onPageChanged: (int index) {
                  setState(() {
                    currectIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.sizeOf(context).width,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              width:
                                  MediaQuery.sizeOf(context).width * (50 / 100),
                              height: 245,
                              margin: const EdgeInsets.only(left: 150, top: 90),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(10),
                                      bottom: Radius.circular(100)),
                                  image: DecorationImage(
                                      image: AssetImage(geser[i].image1),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              width:
                                  MediaQuery.sizeOf(context).width * (50 / 100),
                              height: 245,
                              margin:
                                  const EdgeInsets.only(right: 150, bottom: 90),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(10),
                                      top: Radius.circular(100)),
                                  image: DecorationImage(
                                      image: AssetImage(geser[i].image2),
                                      fit: BoxFit.cover)),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            geser.length, (index) => titikGeser(index)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 7, top: 25),
                        child: Text(
                          geser[i].text,
                          style: const TextStyle(
                              fontSize: 27, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(geser[i].dsc,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                      ),
                    ]),
                  );
                },
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 73, right: 20, left: 20),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20), right: Radius.circular(20))),
              child: TextButton(
                onPressed: () {},
                child: const Text('Next',
                    style: TextStyle(
                      color: AppColors.gray1Color,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container titikGeser(int index) {
    return Container(
      height: 7,
      width: 19,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currectIndex == index
              ? AppColors.primaryColor
              : AppColors.blackColor),
    );
  }
}