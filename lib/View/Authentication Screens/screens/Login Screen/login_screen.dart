import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/View/Authentication%20Screens/screens/Login%20Screen/widgets/form_fields_and_buttons.dart';
import 'package:rista_zoro_app/View/Authentication%20Screens/screens/Login%20Screen/widgets/login_top_part.dart';

import '../../../../View Model/Auth Screen ViewModel/Login Screen ViewModel/controller/login_controller.dart';
import '../../../../utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: AppSizes.defaultSpace,
                      ),
                      Text(
                        "Loading..",
                      )
                    ],
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
