import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/common/Shimmers/app_shimmer.dart';
import 'package:rista_zoro_app/common/widgets/Curved Designs/app_curved_container.dart';
import 'package:rista_zoro_app/utils/constants/colors.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';

import '../../../../../View Model/Navigation Screens ViewModel/Matches Screen ViewModel/controller/match_screen_slider_controller.dart';
import '../../../../../utils/helpers/helper.dart';

class FloatingAppBarContent extends StatelessWidget {
  const FloatingAppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelperFunctions.isDarkMode(context);
    final MatchScreenSliderController sliderController =
        Get.put(MatchScreenSliderController());

    return FlexibleSpaceBar(
      background: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isDark ? AppColors.grey : AppColors.dark,
          ),
          color: isDark ? AppColors.dark : AppColors.grey.withOpacity(0.3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace)
              .copyWith(top: AppSizes.defaultSpace + AppSizes.sm),
          child: Column(
            children: [
              AppCurvedContainer(
                backgroundColor: AppColors.white,
                isBorder: true,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                    prefixIcon: Icon(CupertinoIcons.search),
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.defaultSpace),
              FutureBuilder<List<String>>(
                future: sliderController.bannerFuture,
                builder: (BuildContext context,
                    AsyncSnapshot<List<String>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show a loading indicator while waiting for data
                    return const Center(child: AppShimmers(height: 170));
                  } else if (snapshot.hasError) {
                    // Show an error message if there is an error
                    return const Center(child: Text('Failed to load banners'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    // Show a message if there is no data
                    return const Center(child: Text('No banners available'));
                  } else {
                    // Build the PageView with the fetched banner data
                    return SizedBox(
                      height: 160, // Adjust the height as needed
                      child: PageView.builder(
                        controller: sliderController.pageController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          String imageUrl = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.xl / 2),
                            child: AppCurvedContainer(
                              isBorder: true,
                              child: Card(
                                elevation: 4,
                                margin: EdgeInsets.zero,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(AppSizes.cardRadiusMd),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: imageUrl,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                        child: AppShimmers(height: 160)),
                                    errorWidget: (context, url, error) =>
                                        const Center(child: Icon(Icons.error)),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
