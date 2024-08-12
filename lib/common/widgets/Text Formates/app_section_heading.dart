

import 'package:flutter/material.dart';

class AppSectionHeading extends StatelessWidget {
  final String title;
  final bool showButton;
  final String? subtitle;
  final VoidCallback? onPressed;

  const AppSectionHeading({
    super.key,
    required this.title,
    this.subtitle = "view all", // Default subtitle
    this.onPressed,
    this.showButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        if (showButton)
          TextButton(
            onPressed: onPressed,
            child: Text(subtitle!),
          ),
      ],
    );
  }
}
