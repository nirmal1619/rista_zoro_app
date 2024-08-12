
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class GradientContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final VoidCallback? onPressed;
 final List<Color>? colors;
  const GradientContainer({
    super.key,
    this.height,
    this.width,
    this.child,
    this.onPressed, this.colors=const [

      // Colors.deepPurple,
      // Colors.blueAccent,
      // Colors.deepPurple,
      Colors.deepPurpleAccent,
      Colors.blueAccent,
      Colors.deepPurpleAccent,



    ],
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:colors!,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
          // Curved border
          border: Border.all(
            color: Colors.white, // White border color
            width: 1.0,
          ),
        ),
        child: child,
      ),
    );
  }
}
