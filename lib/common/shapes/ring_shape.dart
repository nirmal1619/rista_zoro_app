
import 'package:flutter/cupertino.dart';

class RingShape extends StatelessWidget {
  final double radius;
  final Color color;
  final Widget? child;

  const RingShape({
    super.key,
    required this.radius,
    required this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: color,
          width: 2.0, // Adjust the width of the ring as needed
        ),
      ),
      child: child,
    );
  }
}
