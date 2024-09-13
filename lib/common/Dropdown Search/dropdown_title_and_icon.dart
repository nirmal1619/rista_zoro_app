import 'package:flutter/cupertino.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../widgets/Curved Designs/app_curved_container.dart';

class DropDownTitleAndIcon extends StatelessWidget {
  const DropDownTitleAndIcon({
    super.key,
    required this.title,
    this.isMust = true,
  });
  final bool? isMust;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppCurvedContainer(
      height: 55,
      backgroundColor: AppColors.white,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  CupertinoIcons.arrowtriangle_down_circle_fill,
                  size: 16,
                ),
                const SizedBox(width: 5),
                Text(
                  title,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            isMust!
                ? Icon(
                    CupertinoIcons.staroflife_fill,
                    color: AppColors.primaryColor.withOpacity(0.8),
                    size: 16,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
