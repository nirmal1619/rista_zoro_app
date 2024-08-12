import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../Api Exceptions/api_exception.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServvices {
  // GET request method implementation
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      // Perform the GET request and set a timeout of 10 seconds
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      // Process the response
      responseJson = returnResponse(response);

      // Log the response for debugging purposes
      log(response.toString());
    }
    // Handle no internet connection error
    on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    // Handle request timeout error
    on RequestTimeOut {
      throw RequestTimeOut("Service is taking long time");
    }
    // Handle any other exceptions
    catch (e) {
      throw Exception('Error: $e');
    }

    // Return the processed JSON response
    return responseJson;
  }

  // POST request method implementation
  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      // Perform the POST request with the provided data and set a timeout of 10 seconds
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(const Duration(seconds: 10));

      // Process the response
      responseJson = returnResponse(response);
    }
    // Handle no internet connection error
    on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    // Handle request timeout error
    on RequestTimeOut {
      throw RequestTimeOut("Service is taking long time");
    }

    // Return the processed JSON response
    return responseJson;
  }

  // Handle the response and status codes
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      // If the response is successful (200 OK), decode the JSON body
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      // If the request is bad (400 Bad Request), throw a BadRequestException
      case 400:
        throw BadRequestException(response.body.toString());

      // If the request is unauthorized or forbidden (401/403), throw an UnauthorisedException
      case 401:
      case 403:
        throw UnauthorisedExpextion(response.body.toString());

      // If the server encounters an error (500 Internal Server Error) or other unspecified errors
      case 500:
      default:
        throw FetchDataException(
            "Error occurred while communicating with server, Status code: ${response.statusCode}");
    }
  }
}
