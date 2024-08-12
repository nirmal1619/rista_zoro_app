import 'package:flutter/material.dart';

import '../../utils/device/device_utility.dart';

class AppFloatingAppbar extends StatelessWidget {
  const AppFloatingAppbar({
    super.key,
    this.expandHeight = 320,
    required this.flexibleSpaceWidget,
    this.bottomWidget,
    this.isPinned = true,
    this.isFloat = true,
  });

  final double expandHeight;
  final Widget flexibleSpaceWidget;
  final Widget? bottomWidget;
  final bool isPinned;
  final bool isFloat;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: isPinned,
      floating: isFloat,
      expandedHeight: expandHeight,
      flexibleSpace: flexibleSpaceWidget,
      bottom: bottomWidget != null
          ? PreferredSize(
        preferredSize: Size.fromHeight(AppDeviceUtils.getAppBarHeight() + 20),
        child: bottomWidget!,
      )
          : null,
    );
  }
}