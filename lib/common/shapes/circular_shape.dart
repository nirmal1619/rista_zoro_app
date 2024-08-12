
import 'package:flutter/material.dart';

class CircularShape extends StatelessWidget {
  final double radius;
  final Color ? color;


  const CircularShape({
    super.key,
    this.radius=200,
    this.color=Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius * 2,
      width: radius * 2,
      decoration: BoxDecoration(
        color: color?.withOpacity(0.2)  ,
        shape: BoxShape.circle,
      ),
    );
  }
}