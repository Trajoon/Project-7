import 'package:flutter/material.dart';
import 'package:projcet_cv/All%20User%20CV/all_cv_view.dart';
import 'package:projcet_cv/helper/constant/color.dart';
import 'package:projcet_cv/views/CV%20Space/cv_view.dart';
import 'package:projcet_cv/views/Edit%20CV/cv_view.dart';
import 'package:projcet_cv/views/HomePage/home_page_view.dart';
import 'package:projcet_cv/views/Profile/profile.dart';


class BottomNavBarr extends StatefulWidget {
  BottomNavBarr({super.key});

  @override
  State<BottomNavBarr> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBarr> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomePageView(),
    CvVIEW(),
    AllCVScreen(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent, 
        unselectedItemColor: Platzi.mainColor,
        onTap: (index) => setState(() => currentIndex = index),
        currentIndex: currentIndex,
        items: [
          buildNavItem(Icons.home, 'Home', 0),
          buildNavItem(Icons.view_comfortable_sharp, 'Your art', 1),
          buildNavItem(Icons.align_horizontal_left, 'Community', 2),
          buildNavItem(Icons.person, 'Profile', 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildNavItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              index == currentIndex ? Platzi.oceanColor : Colors.transparent,
              index == currentIndex ? Platzi.mainColor : Colors.transparent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Icon(icon),
      ),
      label: label,
    );
  }
}
