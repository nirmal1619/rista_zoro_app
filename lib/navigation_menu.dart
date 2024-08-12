import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/common/Drawer/app_drawer.dart';
import 'package:rista_zoro_app/utils/constants/colors.dart';
import 'package:rista_zoro_app/utils/helpers/helper.dart';

import 'View/Navigation Screens/Screens/Home Screen/home_screen.dart';
import 'View/Navigation Screens/Screens/Matches/matches_screen.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  final controller =
      Get.put(NavigationController()); // Instantiate the controller here
  // Global key for the Scaffold
  @override
  Widget build(BuildContext context) {
    bool isDark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      drawer: const AppDrawer(),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.updateScreen(index),
          destinations: const [
            NavigationDestination(
                icon: Icon(CupertinoIcons.home), label: "Home"),
            NavigationDestination(
                icon: Icon(CupertinoIcons.person_2), label: "Matches"),
            NavigationDestination(
                icon: Icon(CupertinoIcons.mail), label: "Inbox"),
            NavigationDestination(
                icon: Icon(CupertinoIcons.chat_bubble), label: "Chat"),
            NavigationDestination(
                icon: Icon(CupertinoIcons.star), label: "Premium"),
          ],
          // Styling part
          animationDuration: const Duration(seconds: 2),
          backgroundColor: isDark ? AppColors.dark : AppColors.light,
          indicatorColor: isDark
              ? AppColors.light.withOpacity(0.1)
              : AppColors.primaryColor.withOpacity(0.5),
        ),
      ),
      body: Obx(
        () => controller.screens[controller.selectedIndex.value],
      ), // Use Obx to observe changes in screens
    );
  }
}

/// State controller
class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final screens = [
    const HomeScreen(),
    const MatchesScreen(),
    Container(),
    Container(),
    Container(),
  ];

  void updateScreen(int index) {
    selectedIndex.value = index;
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
