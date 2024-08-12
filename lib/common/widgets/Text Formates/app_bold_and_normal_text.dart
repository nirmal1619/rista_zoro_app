import 'package:flutter/material.dart';

class AppBoldAndNormalText extends StatelessWidget {
  const AppBoldAndNormalText({
    super.key,
    required this.mainText,
    required this.subText,
    this.isHeadlineMedium = false,
  });

  final String mainText;
  final String subText;
  final bool isHeadlineMedium;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: mainText,
        style: isHeadlineMedium
            ? Theme
            .of(context)
            .textTheme
            .headlineMedium
            : Theme
            .of(context)
            .textTheme
            .bodyLarge,
        children: <TextSpan>[
          TextSpan(
            text: subText,
            style: Theme
                .of(context)
                .textTheme
                .labelLarge,
          ),
        ],
      ),
    );
  }
}
