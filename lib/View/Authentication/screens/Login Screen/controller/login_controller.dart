import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rista_zoro_app/Backend/Api%20Services/api_service.dart';
import 'package:rista_zoro_app/Backend/controllers/network_manager_controller.dart';
import 'package:rista_zoro_app/utils/helpers/show_snackbar.dart';

import '../../../../../Backend/Api utils/Api Constants/api_urls.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final isLoading = false.obs;
  final rememberMe = true.obs;
  final showPassword = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GetStorage storage = GetStorage();
  final networkManager = Get.put(NetworkManagerController());

  @override
  void onInit() {
    super.onInit();
    if (storage.read('rememberMe') == true) {
      phoneController.value.text = storage.read('phone') ?? '';
      passwordController.value.text = storage.read('password') ?? '';
    }
    // Load saved phone and password if they exist
  }

  Future<void> login() async {
    // Start loader
    isLoading.value = true;

    // Validate fields
    if (!formKey.currentState!.validate()) {
      isLoading.value = !true;

      return;
    }

    // Check internet connection
    final isConnected = networkManager.isConnectedToInternet.value;

    if (!isConnected) {
      ShowSnackbar.warningMessage("error", "no internet");
      isLoading.value = !true;

      return;
    }

    try {
      await ApiService.loginApiService(
          ApiUrls.loginApi,
          phoneController.value.text,
          passwordController.value.text,
          rememberMe.value);
      isLoading.value = !true;
    } catch (e) {
      ShowSnackbar.errorMessage("", e.toString());
    }
  }

  @override
  void onClose() {
    phoneController.value.dispose();
    passwordController.value.dispose();
    super.onClose();
  }
}
