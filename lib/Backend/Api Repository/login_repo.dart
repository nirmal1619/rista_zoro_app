import 'dart:developer'; // Import this for using log

import 'package:rista_zoro_app/Backend/Api%20Model/login%20model/login_model.dart';
import 'package:rista_zoro_app/Backend/Api%20Services/extended_api_services.dart';
import 'package:rista_zoro_app/Backend/Api%20utils/Api%20Constants/api_urls.dart';

class LoginRepo {
  final NetworkApiServices _networkApiServices = NetworkApiServices();

  Future<dynamic> loginToApp(LoginModel loginModel) async {
    try {
      // Convert the model to a map
      final data = loginModel.toJson();

      // Make the POST request
      var response =
          await _networkApiServices.getPostApiResponse(ApiUrls.loginApi, data);
      // log(response.toString());
      return response;
    } catch (e) {
      // Log the exception for debugging
      log('Error in createAccount repo: $e');

      // Rethrow the caught exception to handle it further up the call stack
      rethrow;
    }
  }
}
