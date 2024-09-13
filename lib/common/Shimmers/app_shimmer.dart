import 'package:flutter/material.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmers extends StatelessWidget {
  const AppShimmers(
      {super.key, this.width = double.infinity, required this.height});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.25),
      highlightColor: Colors.white.withOpacity(0.25),
      period: Duration(seconds: 2),
      // direction: ShimmerDirection.ttb,
      child: Card(
        elevation: 2,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg)),
        ),
      ),
    );
  }
}
