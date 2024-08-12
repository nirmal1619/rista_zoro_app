import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../common/User Model/user_model.dart';
import '../../navigation_menu.dart';
import '../../utils/helpers/show_snackbar.dart';
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
            storage.write('phone', phone);
            storage.write('password', password);
            storage.write('rememberMe', true);
          }

          Get.offAll(() => NavigationMenu());
        } else {
          // Show specific error message from API
          // String errorMessage = data['msg'] ?? 'Check phone or Password';
          ShowSnackbar.errorMessage('Error', "Check phone or Password");
        }
      } else {
        // Handle HTTP errors
        ShowSnackbar.errorMessage(
            'Error', 'Failed to login: ${response.reasonPhrase}');
      }
    } catch (e) {
      ShowSnackbar.errorMessage('Error', 'An error occurred: ${e.toString()}');
    } finally {
      storage.write("isLogin", true);
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
              'user', user.toJson()); // Save user data to local storage
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
