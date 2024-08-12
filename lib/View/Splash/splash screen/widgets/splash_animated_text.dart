import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/utils/constants/texts.dart';

import '../../../../common/shapes/rectangle_shape.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../splash controller/splash_screen_controller.dart';

class SplashAnimatedText extends StatelessWidget {
  const SplashAnimatedText({
    super.key,
    required Animation<Offset> animation,
  }) : _animation = animation;

  final Animation<Offset> _animation;

  @override
  Widget build(BuildContext context) {
    final SplashScreenController controller = Get.put(SplashScreenController());
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                AppTexts.splashText1,
                textStyle: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .apply(color: Colors.white),
                speed: const Duration(milliseconds: 100),
              ),
              FadeAnimatedText(
                AppTexts.splashText2,
                textStyle: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .apply(color: Colors.white),
                duration: const Duration(seconds: 3),
              ),
            ],
            onFinished: controller.onAnimationCompleted,
            isRepeatingAnimation: false,
            totalRepeatCount: 1,
          ),
          Obx(() => AnimatedOpacity(
                // onEnd: controller.onAnimationCompleted,
                opacity: controller.showFinalText.value ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: SlideTransition(
                  position: _animation,
                  child: RectangularShape(
                    isCurved: true,
                    child: Padding(
                      padding: const EdgeInsets.all(AppSizes.md),
                      child: Text(
                        AppTexts.appName,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .apply(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
