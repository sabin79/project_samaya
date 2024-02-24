import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:project_samaya/controller/bottom_nav_controller.dart';

import 'calender_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

class BottomNavPage extends StatelessWidget {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController bottomNavController = Get.put(BottomNavController());
    final screens = [
      const HomePage(),
      const CalenderPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: bottomNavController.selectedIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: const Color.fromARGB(255, 78, 128, 255),
        unselectedItemColor: Colors.grey.shade600,
        currentIndex: bottomNavController.selectedIndex.value,
        onTap: (index) {
          bottomNavController.changeIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.calendar),
            label: 'Callender',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.profile),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
