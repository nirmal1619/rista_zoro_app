import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View Model/Auth Screen ViewModel/Create Screen ViewModel/create screen controller/create_profile_controller.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cont = Get.put(CreateProfileController());
    return Scaffold(
      body: PageView(
        children: [
          ElevatedButton(
              onPressed: () async {
                await cont.createAccount();
              },
              child: const Text("get details"))
        ],
      ),
    );
  }
}
