
import 'package:flutter/material.dart';

class AppElevatedIconButton extends StatelessWidget {
  const AppElevatedIconButton({
    super.key, required this.title, required this.icon, required this.onPressed,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Add your onPressed code here!
      },
      icon: Icon(icon, color: Colors.white),
      label: Text(title),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        textStyle: Theme
            .of(context)
            .textTheme
            .labelSmall,
      ),
    );
  }
}