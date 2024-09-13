import 'package:flutter/material.dart';
import 'package:rista_zoro_app/utils/constants/image_strings.dart';

import '../../shapes/circular_shape.dart';

class AppPrimaryDesign extends StatelessWidget {
  const AppPrimaryDesign({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            AppImages.loginImage,
            fit: BoxFit.cover,
            opacity: const AlwaysStoppedAnimation(0.9),
          ),
        ),

        const Positioned(
          top: -200,
          right: -100,
          child: CircularShape(
            radius: 150,
          ),
        ),
        const Positioned(
          top: -100,
          right: -100,
          child: CircularShape(
            radius: 150,
          ),
        ),
        const Positioned(
          bottom: -200,
          left: -100,
          child: CircularShape(
            radius: 150,
          ),
        ),
        const Positioned(
          bottom: -100,
          left: -100,
          child: CircularShape(radius: 150, color: Colors.white),
        ),
        Positioned(child: child ?? const SizedBox()),
        // Positioned(
        //   left: 0,
        //     right: 0,
        //     // top: AppDeviceUtils.getAppBarHeight(),
        //     child: child ?? SizedBox())
        // Positioned(
        //   bottom: -50,
        //   left: -100,
        //   child: CircularShape(radius: 105, color: Colors.white),
        // ),
      ],
    );
  }
}
