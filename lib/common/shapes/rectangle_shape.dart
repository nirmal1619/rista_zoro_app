import 'package:flutter/cupertino.dart';
import 'package:rista_zoro_app/utils/constants/colors.dart';

class RectangularShape extends StatelessWidget {
  // final double height;
  // final double width;
  final Color color; // Added color parameter
  final bool isCurved;
  final Widget? child;

  const RectangularShape({
    super.key,

    this.isCurved = false,
    this.color = AppColors.white,
    this.child,
    // Make color required
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height,
      // width: width,
      decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          shape: BoxShape.rectangle,
          borderRadius: isCurved
              ? BorderRadius.circular(12)
              : null) // Explicitly set shape to rectangle
      ,
      child: child,
    );
  }
}
