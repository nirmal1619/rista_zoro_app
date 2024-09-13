import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/utils/helpers/helper.dart';

import '../../../../../utils/constants/sizes.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.1,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
              child: Image(
                height: AppHelperFunctions.screenHeight() * 0.6,
                filterQuality: FilterQuality.high,
                image: AssetImage(image),
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: AppSizes.defaultSpace,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: AppSizes.spaceBtwItems,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
