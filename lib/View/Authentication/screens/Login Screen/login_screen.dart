import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rista_zoro_app/View/Authentication/screens/Login%20Screen/widgets/form_fields_and_buttons.dart';
import 'package:rista_zoro_app/View/Authentication/screens/Login%20Screen/widgets/login_top_part.dart';

import '../../../../utils/constants/sizes.dart';
import 'controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: Lottie.asset(
                    'assets/search.json',
                    errorBuilder: (context, error, stackTrace) {
                      return const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Loading...'),
                          SizedBox(height: 20),
                          CircularProgressIndicator(),
                        ],
                      );
                    },
                  ),
                )
              : ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  reverse: true,
                  children: [
                    const LoginTopPart(),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    const FormFieldsAndButtons()
                  ].reversed.toList(),
                ),
        ));
  }
}
