import 'package:flutter/cupertino.dart';
import 'package:rista_zoro_app/utils/constants/image_strings.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper.dart';

class LoginTopPart extends StatelessWidget {
  const LoginTopPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHelperFunctions.screenHeight() * 0.5,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        border: Border.all(color: AppColors.light),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
        child: Image.asset(AppImages.loginImage, fit: BoxFit.fill),
      ),
    );
  }
}
