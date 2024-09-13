import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../common/User Model/user_model.dart';
import '../../navigation_menu.dart';
import '../../utils/helpers/show_snackbar.dart';
import '../../utils/storage/app_storage_key.dart'; // Import the storage keys
import '../Api utils/Api Constants/api_urls.dart';

class ApiService {
  // Login API method
  static Future<void> loginApiService(
      String apiName, String phone, String password, bool rememberMe) async {
    final GetStorage storage = GetStorage();
    try {
      final response = await http.post(
        Uri.parse(ApiUrls.apiBaseUrl + apiName),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'phone': phone,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data['result'] == 1) {
          if (rememberMe) {
            storage.write(AppStorageKey.phone, phone); // Use the storage key
            storage.write(
                AppStorageKey.password, password); // Use the storage key
            storage.write(
                AppStorageKey.rememberMe, true); // Use the storage key
          }

          storage.write(AppStorageKey.isLogin, true);
          Get.offAll(() => AppNavigationMenu());
        } else {
          ShowSnackbar.errorMessage('Error', "Check phone or Password");
        }
      } else {
        ShowSnackbar.errorMessage(
            'Error', 'Failed to login: ${response.reasonPhrase}');
      }
    } catch (e) {
      ShowSnackbar.errorMessage('Error', 'An error occurred: ${e.toString()}');
    } finally {
      // Use the storage key
    }
  }

  // Get user details API method
  static Future<void> getDetailsApiService(String apiName) async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrls.apiBaseUrl + apiName),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data['result'] == 1) {
          // Parse user details into User model
          var userData = data['user_data'];
          User user = User.fromJson(userData);

          // You can now use the 'user' object as needed
          print(user); // Example: Print user details

          // Optionally, you could store the user data in local storage
          final GetStorage storage = GetStorage();
          storage.write(
              AppStorageKey.user, user.toJson()); // Use the storage key
        } else {
          ShowSnackbar.errorMessage('Error', data['msg']);
        }
      } else {
        ShowSnackbar.errorMessage(
            'Error', 'Failed to fetch user details: ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint(e.toString());
      ShowSnackbar.errorMessage('Error', 'An error occurred: ${e.toString()}');
    }
  }
}
