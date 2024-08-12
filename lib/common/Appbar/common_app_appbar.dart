import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/utils/constants/colors.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';
import 'package:rista_zoro_app/utils/helpers/helper.dart';


import '../../utils/device/device_utility.dart';

class CommonAppAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppAppbar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed, this.isPadding=false

      });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final bool isPadding;

  @override
  Widget build(BuildContext context) {
    bool isDark=AppHelperFunctions.isDarkMode(context);
    return AppBar(
      title: Padding(
        padding: isPadding ?   const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace):EdgeInsets.zero ,
        child: title,
      ),
      actions: actions,
      automaticallyImplyLeading: false,

      leading: showBackArrow
          ? IconButton(
              onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back))
          : leadingIcon != null
              ? IconButton(
                  onPressed: leadingOnPressed, icon: Icon(leadingIcon,color: isDark ? AppColors.light : AppColors.dark,))
              : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}

class Iconsax {}
