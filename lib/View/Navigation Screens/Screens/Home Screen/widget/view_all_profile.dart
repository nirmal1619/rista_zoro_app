import 'package:flutter/material.dart';
import 'package:rista_zoro_app/common/Appbar/common_app_appbar.dart';
import 'package:rista_zoro_app/common/widgets/Page%20view%20builder/app_pageview_builder.dart';
import 'package:rista_zoro_app/common/widgets/Profile%20Card/profile_card.dart';

class ViewAllProfile extends StatelessWidget {
  const ViewAllProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppAppbar(
          showBackArrow: true,
          title: Text('Profiles'),
        ),
        body: AppPageViewBuilder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) => const ProfileCard(),
        ));
  }
}
