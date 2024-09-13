import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/utils/constants/image_strings.dart';
import 'package:rista_zoro_app/utils/constants/texts.dart';

import '../../../../View Model/Splash Screen ViewModel/splash controller/splash_screen_controller.dart';
import '../../../../utils/constants/colors.dart';

class SplashAnimatedText extends StatefulWidget {
  const SplashAnimatedText({
    super.key,
    required this.animation,
  });

  final Animation<Offset> animation;

  @override
  _SplashAnimatedTextState createState() => _SplashAnimatedTextState();
}

class _SplashAnimatedTextState extends State<SplashAnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Start with a scale of 1.0 (normal size) and scale up to 5.0
    _scaleAnimation = Tween<double>(begin: 1.0, end: 5.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    // Start the scaling animation after a delay
    Future.delayed(const Duration(seconds: 3), () {
      _scaleController.forward();
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SplashScreenController controller = Get.put(SplashScreenController());
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  AppTexts.splashText1,
                  textStyle: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .apply(color: AppColors.primaryColor),
                  speed: const Duration(milliseconds: 100),
                ),
                FadeAnimatedText(
                  AppTexts.splashText2,
                  textStyle: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .apply(color: AppColors.primaryColor),
                  duration: const Duration(seconds: 3),
                ),
              ],
              onFinished: controller.onAnimationCompleted,
              isRepeatingAnimation: false,
              totalRepeatCount: 1,
            ),
          ),
          const SizedBox(height: 20), // Add some space between texts
          Obx(
            () => AnimatedOpacity(
              opacity: controller.showFinalText.value ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: SlideTransition(
                position: widget.animation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: 7 * _scaleAnimation.value, // Adjusts the radius
                    child: Image.asset(AppImages.appLogo),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
