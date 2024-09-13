import 'dart:developer'; // Import this for using log

import 'package:rista_zoro_app/Backend/Api%20Services/extended_api_services.dart';
import 'package:rista_zoro_app/Backend/Api%20utils/Api%20Constants/api_urls.dart';

import '../Api Model/create account model/create_account_model.dart';

class CreateProfileRepo {
  final NetworkApiServices _networkApiServices = NetworkApiServices();

  Future<dynamic> createAccount(CreateAccountModel accountModel) async {
    try {
      // Convert the model to a map
      final data = accountModel.toJson();

      // Make the POST request
      var response =
          await _networkApiServices.getPostApiResponse(ApiUrls.signUpApi, data);
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
