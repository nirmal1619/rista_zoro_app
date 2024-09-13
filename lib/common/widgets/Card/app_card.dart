import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  const AppCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);

    return Card(
      surfaceTintColor: isDark ? Colors.blue : AppColors.primaryColor,
      elevation: isDark ? 8 : 0.7,
      child: child,
    );
  }
}
