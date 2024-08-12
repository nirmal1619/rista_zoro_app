
import 'package:flutter/material.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';

import '../../../../common/widgets/Curved Designs/app_curved_container.dart';
import '../../../../common/widgets/Read more/app_read_more.dart';
import '../../../../common/widgets/Text Formates/app_bold_and_normal_text.dart';

class UserAboutSection extends StatelessWidget {
  const UserAboutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ const AppBoldAndNormalText(
        mainText: "About ", subText: "", isHeadlineMedium: true,),
        const SizedBox(height: AppSizes.spaceBtwItems,),
        AppCurvedContainer(
          height: 120,
          backgroundColor: Colors.grey.withOpacity(0.1),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child:
            AppReadMore(
              maxLines: 6,
              expandText: "Scroll Down",
              closeText: "Close",
            )
            ),
          ),
        ),],);
  }
}