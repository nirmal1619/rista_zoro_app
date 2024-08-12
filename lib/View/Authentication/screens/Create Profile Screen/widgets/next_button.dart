import 'package:flutter/cupertino.dart';

import '../../../../../common/widgets/Buttons/app_elevated_icon_button.dart';
import '../../../../../utils/constants/texts.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  const NextButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: AppElevatedIconButton(
          title: AppTexts.next,
          icon: CupertinoIcons.forward,
          onPressed: onPressed),
    );
  }
}
