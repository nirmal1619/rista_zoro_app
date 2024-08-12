
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../utils/constants/texts.dart';

class AppReadMore extends StatelessWidget {
  const AppReadMore({
    super.key, this.expandText, this.closeText, required this.maxLines,
  });

  final String? expandText;
  final String? closeText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {

    return ReadMoreText(
      AppTexts.aboutUser,
      style: Theme.of(context).textTheme.bodySmall,
      trimLines: maxLines,
      moreStyle: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.blue),
      colorClickableText: Colors.blue,
      trimMode: TrimMode.Line,
      trimCollapsedText: '$expandText',
      trimExpandedText: ' $closeText',

    );
  }
}

