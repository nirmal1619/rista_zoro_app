import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/common/Appbar/common_app_appbar.dart';
import 'package:rista_zoro_app/common/widgets/Curved%20Designs/app_curved_container.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';
import 'package:rista_zoro_app/utils/helpers/show_toast.dart';

import '../../../utils/helpers/helper.dart';
import '../../../utils/routes/app_screens.dart';
import '../../../utils/storage/app_storage.dart';
import '../../../utils/storage/app_storage_key.dart'; // Assuming this is where your fieldFocusChange function is located

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode firstFocusNode = FocusNode();
    final FocusNode secondFocusNode = FocusNode();
    final FocusNode thirdFocusNode = FocusNode();
    final FocusNode fourthFocusNode = FocusNode();

    return Scaffold(
      appBar: const CommonAppAppbar(
        showBackArrow: true,
        title: Text("Enter OTP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter OTP",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: AppSizes.defaultSpace),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultSpace * 1.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppCurvedContainer(
                    width: 50,
                    isBorder: true,
                    child: TextFormField(
                      focusNode: firstFocusNode,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(1),
                      ],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          AppHelperFunctions.fieldFocusChange(
                              context, firstFocusNode, secondFocusNode);
                        }
                      },
                    ),
                  ),
                  AppCurvedContainer(
                    width: 50,
                    isBorder: true,
                    child: TextFormField(
                      focusNode: secondFocusNode,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(1),
                      ],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          AppHelperFunctions.fieldFocusChange(
                              context, secondFocusNode, thirdFocusNode);
                        } else {
                          AppHelperFunctions.fieldFocusChange(
                              context, secondFocusNode, firstFocusNode);
                        }
                      },
                    ),
                  ),
                  AppCurvedContainer(
                    width: 50,
                    isBorder: true,
                    child: TextFormField(
                      focusNode: thirdFocusNode,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(1),
                      ],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          AppHelperFunctions.fieldFocusChange(
                              context, thirdFocusNode, fourthFocusNode);
                        } else {
                          AppHelperFunctions.fieldFocusChange(
                              context, thirdFocusNode, secondFocusNode);
                        }
                      },
                    ),
                  ),
                  AppCurvedContainer(
                    width: 50,
                    isBorder: true,
                    child: TextFormField(
                      focusNode: fourthFocusNode,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(1),
                      ],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          AppHelperFunctions.fieldFocusChange(
                              context, fourthFocusNode, thirdFocusNode);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.defaultSpace * 1),
            TextButton(
              onPressed: () {
                // Implement your logic to request OTP again
              },
              child: const Text(
                "Didn't recived OTP? Request OTP",
                style: TextStyle(
                  color: Colors.blue,
                  // decoration: TextDecoration.
                ),
              ),
            ),
            const SizedBox(height: AppSizes.defaultSpace),
            SizedBox(
              width: double.infinity, // Make button take full width
              child: ElevatedButton(
                onPressed: () async {
                  await AppStorage.writeData(AppStorageKey.isLogin, true);
                  await AppStorage.writeData(AppStorageKey.isFirstTime, false);
                  ShowToast.message("Welcome", context);
                  Get.offAllNamed(AppScreens.naviMenuScreen);

                  // Implement your logic for the "Continue" button
                },
                child: const Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
