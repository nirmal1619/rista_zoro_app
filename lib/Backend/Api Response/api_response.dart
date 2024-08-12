import 'package:rista_zoro_app/Backend/Api%20Response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.data, this.message, this.status);

  ApiResponse.loading() : status = Status.LOADING;

  // Corrected constructor for completed state
  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  // Corrected constructor for error state
  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status\nMessage: $message\nData: $data";
  }
}
