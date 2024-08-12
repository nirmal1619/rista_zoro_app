import 'package:flutter/material.dart';

class AppPageViewBuilder extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final PageController pageController;
  final ValueChanged<int>? onPageChanged;
  final Axis scrollDirection;
  final ScrollPhysics physics;

  AppPageViewBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    PageController? pageController,
    this.onPageChanged,
    this.scrollDirection = Axis.horizontal,
    this.physics = const PageScrollPhysics(),
  })  : pageController = pageController ?? PageController();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: itemCount,
      onPageChanged: onPageChanged,
      scrollDirection: scrollDirection,
      physics: physics,
      itemBuilder: itemBuilder,
    );
  }
}
