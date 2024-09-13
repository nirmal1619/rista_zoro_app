import '../../../utils/helpers/show_snackbar.dart';
import '../../Api Exceptions/api_exception.dart';

class ApiHelpers {
  static void handleException(Exception e) {
    if (e is FetchDataException) {
      ShowSnackbar.errorMessage('Communication Error', e.toString());
    } else if (e is BadRequestException) {
      ShowSnackbar.errorMessage('Bad Request', e.toString());
    } else if (e is UnauthorisedException) {
      // Updated class name
      ShowSnackbar.errorMessage('Unauthorized', e.toString());
    } else if (e is RequestTimeoutException) {
      // Updated class name
      ShowSnackbar.errorMessage('Request Timeout', e.toString());
    } else {
      ShowSnackbar.errorMessage(
          'Error', 'An unexpected error occurred. Please try again later.');
    }
  }
}
