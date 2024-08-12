
import 'package:flutter/cupertino.dart';

class AppListViewSeparator extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final int itemCount;
  final Axis scrollDirection;
  final ScrollPhysics ? physics;

  const AppListViewSeparator({
    super.key,
    required this.itemBuilder,
    required this.separatorBuilder,
    required this.itemCount,
    this.scrollDirection = Axis.vertical, this.physics= const BouncingScrollPhysics(),
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
