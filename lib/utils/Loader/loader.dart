import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../constants/colors.dart';

class AppFullScreenLoader {
  static Future openLoadingDialog(
      BuildContext context, String text, String animation) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: Get.isDarkMode ? AppColors.dark : AppColors.white,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  AppAnimationLoaderWidget(
                    text: text,
                    animation: animation,
                    showAction: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static stopLoaing(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class AppAnimationLoaderWidget extends StatelessWidget {
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const AppAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    required this.showAction,
    this.actionText,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            animation,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          const SizedBox(height: 16),
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
