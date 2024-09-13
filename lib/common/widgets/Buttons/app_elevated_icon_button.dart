import 'package:flutter/material.dart';

class AppElevatedIconButton extends StatelessWidget {
  const AppElevatedIconButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.textSize = 10,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(
        title,
        style: TextStyle(fontSize: textSize),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        textStyle: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
