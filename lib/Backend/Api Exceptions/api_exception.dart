import '../Api Errors/api_errors.dart';

class AppExceptions implements Exception {
  final String? message;
  final String prefix;

  AppExceptions([this.message, this.prefix = '']);

  @override
  String toString() {
    return '$prefix$message';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, ApiErrors.fetchDataError);
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message])
      : super(message, ApiErrors.badRequestError);
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message])
      : super(message, ApiErrors.unauthorizedError);
}

class RequestTimeoutException extends AppExceptions {
  RequestTimeoutException([String? message])
      : super(message, ApiErrors.requestTimeoutError);
}
