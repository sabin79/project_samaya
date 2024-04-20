import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:project_samaya/view/admin_department/controller/admin_nav_bar_controller.dart';
import 'package:project_samaya/view/admin_department/screen/admin_panel.dart';
import 'package:project_samaya/view/admin_department/screen/admin_profile.dart';
import 'package:project_samaya/view/admin_department/screen/employee_detail_list/asign_project.dart';

import 'task_detail/subtask_tab.dart';

class AdminNavBar extends StatelessWidget {
  const AdminNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController bottomNavController = Get.put(BottomNavController());
    final screens = [
      const AdminHomePage(),
      const TaskDetailPage(),
      const AdminProfilePage(),
    ];
    return Scaffold(
      body: Obx(
        () => IndexedStack(
            index: bottomNavController.CurrentTab.value, children: screens),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedItemColor: const Color.fromARGB(255, 78, 128, 255),
          unselectedItemColor: Colors.grey.shade600,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (index) {
            bottomNavController.changeIndex(index);
          },
          currentIndex: bottomNavController.CurrentTab.value,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  IconlyBold.home,
                  color: bottomNavController.CurrentTab.value == 0
                      ? Colors.blue
                      : Colors.grey.shade600,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.task,
                  color: bottomNavController.CurrentTab.value == 1
                      ? Colors.blue
                      : Colors.grey.shade600,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  IconlyBold.profile,
                  color: bottomNavController.CurrentTab.value == 3
                      ? Colors.blue
                      : Colors.grey.shade600,
                ),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
