import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/common/Shimmers/app_shimmer.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';

import '../../../../../View Model/Navigation Screens ViewModel/Home Screen ViewModel/home screen controller/home_screen_slider_controller.dart';
import '../../../../../common/widgets/Curved Designs/app_curved_container.dart';
import '../../../../../common/widgets/Page view builder/app_pageview_builder.dart';

class HomeScreenBanners extends StatelessWidget {
  const HomeScreenBanners({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeScreenSliderController sliderController =
        Get.put(HomeScreenSliderController());

    return FutureBuilder<List<String>>(
      future: sliderController.bannerFuture,
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for data
          return const Center(child: AppShimmers(height: 170));
        } else if (snapshot.hasError) {
          // Show an error message if there is an error
          return const Center(
              child: AppCurvedContainer(
            height: 170,
            child: Text('Failed to load banners'),
          ));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Show a message if there is no data
          return const Center(child: Text('No banners available'));
        } else {
          // Build the PageView with the fetched banner data
          return SizedBox(
            height: 200, // Adjust the height as needed
            child: AppPageViewBuilder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                String imageUrl = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
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
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Center(child: Icon(Icons.error)),
                        ),
                      ),
                    ),
                  ),
                );
              },
              pageController: sliderController.pageController,
            ),
          );
        }
      },
    );
  }
}
