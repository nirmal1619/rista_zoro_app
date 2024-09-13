import 'package:flutter/cupertino.dart';

class AppListViewSeparator extends StatelessWidget {
  final IndexedWidgetBuilder separatorBuilder;
  final int itemCount;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final IndexedWidgetBuilder itemBuilder;
  const AppListViewSeparator({
    super.key,
    required this.separatorBuilder,
    required this.itemCount,
    this.scrollDirection = Axis.vertical,
    this.physics = const BouncingScrollPhysics(),
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: physics,
      shrinkWrap: true,
      scrollDirection: scrollDirection,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
      itemCount: itemCount,
    );
  }
}
