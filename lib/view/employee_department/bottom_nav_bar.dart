import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'controller/bottom_nav_controller.dart';

import 'screens/home_page.dart';
import 'screens/profile_page.dart';

class EmployeeNavBar extends StatelessWidget {
  const EmployeeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    //BOTTOM NAVIGATION BAR CONTROLLER
    NabBarController NavBarController = Get.put(NabBarController());

    //LIST OF DIFFERENT PAGES
    final screens = [
      const HomePage(),
      const ProfilePage(),
    ];

    return Scaffold(
      body: Obx(
        () => IndexedStack(
            index: NavBarController.selectedIndex.value, children: screens),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedItemColor: const Color.fromARGB(255, 78, 128, 255),
          unselectedItemColor: Colors.grey.shade600,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (index) {
            NavBarController.changeIndex(index);
          },
          currentIndex: NavBarController.selectedIndex.value,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  IconlyBold.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  IconlyBold.profile,
                ),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
