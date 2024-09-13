import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/View/Navigation%20Screens/Screens/Matches%20Screen/widgets/floating_appbar_content.dart';
import 'package:rista_zoro_app/View/Navigation%20Screens/Screens/Matches%20Screen/widgets/material_tabbar.dart';
import 'package:rista_zoro_app/common/Appbar/app_floating_appbar.dart';
import 'package:rista_zoro_app/common/widgets/ListBuilder%20Seprator/app_listview_seprator.dart';
import 'package:rista_zoro_app/common/widgets/Profile%20Card/profile_card.dart';

import '../../../../View Model/Navigation Screens ViewModel/Matches Screen ViewModel/controller/match_screen_slider_controller.dart';

class MatchesScreen extends StatelessWidget {
  final MatchScreenSliderController controller =
      Get.put(MatchScreenSliderController());

  MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        body: Obx(() {
          // Get the scroll controller from the controller
          final ScrollController scrollController = controller.scrollController;
          // Handle floating app bar appearance
          final isAtTop = controller.isAtTop.value;
          final scrollDirection = controller.scrollDirection.value;

          return CustomScrollView(
            controller: scrollController,
            slivers: [
              AppFloatingAppbar(
                flexibleSpaceWidget: FloatingAppBarContent(),
                bottomWidget: MaterialTabBar(),
                isFloat: true, // Ensure the app bar floats
                isPinned: true, // Ensure the app bar is pinned
              ),
              SliverFillRemaining(
                child: TabBarView(
                  children: List.generate(
                    5,
                    (index) => AppListViewSeparator(
                      separatorBuilder: (___, ____) => const SizedBox(),
                      scrollDirection: Axis.vertical,
                      itemCount: 10, // Handle empty list
                      physics: isAtTop
                          ? const NeverScrollableScrollPhysics()
                          : const PageScrollPhysics(),
                      itemBuilder: (_, index) => ProfileCard(),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
