import 'package:flutter/material.dart';
import 'package:rista_zoro_app/View/Navigation%20Screens/Screens/Matches/widgets/floating_appbar_content.dart';
import 'package:rista_zoro_app/View/Navigation%20Screens/Screens/Matches/widgets/material_tabbar.dart';
import 'package:rista_zoro_app/common/Appbar/app_floating_appbar.dart';

// Ensure the path is correct

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            AppFloatingAppbar(
              flexibleSpaceWidget: FloatingAppBarContent(),
              bottomWidget: const MaterialTabBar(),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: List.generate(
                    5,
                    (index) =>
                        Container()), // Ensure the number of containers matches the number of tabs
              ),
            ),
          ],
        ),
      ),
    );
  }
}
