import 'package:flutter/material.dart';
import 'package:rista_zoro_app/utils/constants/image_strings.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';

import '../../../../../common/widgets/Gradient/gradient.dart';

class PremiumPackagesCard extends StatelessWidget {
  const PremiumPackagesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientContainer(
            child: Image.asset(
          AppImages.packageBackground,
          colorBlendMode: BlendMode.colorBurn,
          fit: BoxFit.cover,
          opacity: const AlwaysStoppedAnimation(0.15), // Set the opacity value here
        )),
        Padding(
          padding: const EdgeInsets.all(AppSizes.sm),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Premium Package',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  '\$889',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 20),
                for (var benefit in [
                  'Benefit 1',
                  'Benefit 2',
                  'Benefit 3',
                  'Benefit 4',
                ])
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Row(
                        children: [
                          const Icon(Icons.check, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(
                            benefit,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ))
              ]),
        ),
      ],
    );
  }
}
