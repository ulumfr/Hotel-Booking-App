import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  size: 27,
                  color: AppColors.primaryColor,
                ))
          ],
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome, Ulum',
                style: TextStyle(color: AppColors.blackColor),
              ),
              Text(
                'Malang',
                style: TextStyle(color: AppColors.blackColor, fontSize: 15),
              )
            ],
          ),
        ),
        body: const SafeArea(
          child: Column(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.gray3Color,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: 'Book'),
            BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Wish List'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_rounded), label: 'Profile')
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}