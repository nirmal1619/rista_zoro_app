import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          ElevatedButton(onPressed: () async {}, child: const Text("get details"))
        ],
      ),
    );
  }
}
