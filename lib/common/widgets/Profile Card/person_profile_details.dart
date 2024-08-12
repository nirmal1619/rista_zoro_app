import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/Text Formates/app_bold_and_normal_text.dart';
import '../../../../utils/constants/sizes.dart';

import '../../../../utils/constants/texts.dart';

class PersonProfileDetails extends StatelessWidget {
  const PersonProfileDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBoldAndNormalText(
          mainText: AppTexts.userName ,
          subText: "  ${AppTexts.userPronounsValue}",
          isHeadlineMedium: true,
        ),
        SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            AppBoldAndNormalText(
              mainText: AppTexts.userAge,
              subText: AppTexts.userAgeValue,
            ),
            SizedBox(
              width: AppSizes.spaceBtwItems * 2,
            ),
            AppBoldAndNormalText(
              mainText: AppTexts.userEducation,
              subText: AppTexts.userEducationValue,
            ),
            SizedBox(
              width: AppSizes.spaceBtwItems * 2,
            ),
            AppBoldAndNormalText(
              mainText: AppTexts.userCaste,
              subText: AppTexts.userCasteValue,
            ),
          ],
        ),
        SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            AppBoldAndNormalText(
              mainText: AppTexts.userHeight,
              subText: AppTexts.userHeightValue,
            ),
            SizedBox(
              width: AppSizes.spaceBtwItems * 2,
            ),
            AppBoldAndNormalText(
              mainText: AppTexts.userProfession,
              subText: AppTexts.userProfessionValue,
            ),
          ],
        ),
        SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),
        AppBoldAndNormalText(
          mainText: AppTexts.userLocation,
          subText: AppTexts.userLocationValue,
        ),
      ],
    );
  }
}
