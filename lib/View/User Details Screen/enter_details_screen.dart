import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/common/Appbar/common_app_appbar.dart';
import 'package:rista_zoro_app/utils/constants/colors.dart';

import '../../utils/routes/app_screens.dart';

class EnterDetailsScreen extends StatelessWidget {
  const EnterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppAppbar(
        title: Text("Complete Your Profile"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: AppColors.primaryColor,
              size: 80,
            ),
            SizedBox(height: 20),
            Text(
              'Your profile is not complete yet.\nPlease complete it.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppScreens.careerDetailsScreen);
        },
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded shape
        ),
        child: const Icon(Icons.arrow_forward,
            color: Colors.white), // Forward arrow icon
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
