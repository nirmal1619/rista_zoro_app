import 'dart:developer'; // Use for logging

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/Backend/Api%20Model/login%20model/login_model.dart';
import 'package:rista_zoro_app/Backend/Api%20Repository/login_repo.dart';
import 'package:rista_zoro_app/utils/storage/app_storage.dart';
import 'package:rista_zoro_app/utils/storage/app_storage_method.dart';

import '../../../../navigation_menu.dart';
import '../../../../utils/storage/app_storage_key.dart';
import '../../../Network ViewModel/network_manager_controller.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final isLoading = false.obs;
  final rememberMe = true.obs;
  final showPassword = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final networkManager = Get.put(NetworkManagerController());

  @override
  void onInit() {
    super.onInit();
    // Load saved phone and password if they exist
    if (AppStorage.readData(AppStorageKey.rememberMe) == true) {
      phoneController.value.text =
          AppStorage.readData(AppStorageKey.phone) ?? '';
      passwordController.value.text =
          AppStorage.readData(AppStorageKey.password) ?? '';
    }
  }

  Future<void> login() async {
    // Start loader
    isLoading.value = true;

    // Validate fields
    if (!formKey.currentState!.validate()) {
      isLoading.value = false;
      return;
    }

    LoginModel loginModel = LoginModel(
      phoneNumber: phoneController.value.text,
      password: passwordController.value.text,
    );

    try {
      final loginRepo = LoginRepo();
      var data = await loginRepo.loginToApp(loginModel);

      if (data['result'] == 1) {
        AppStorageMethod.saveDataAtLoginScreen(rememberMe.value, loginModel);
        Get.offAll(() => AppNavigationMenu());
      } else {
        // Handle login failure (e.g., show an error message)
      }
    } catch (e) {
      log("error in login e.toString()");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    phoneController.value.dispose();
    passwordController.value.dispose();
    super.onClose();
  }
}
