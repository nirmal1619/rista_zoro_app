// login_model.dart
class LoginModel {
  final String phoneNumber;
  final String password;

  LoginModel({
    required this.phoneNumber,
    required this.password,
  });

  // Convert the model to JSON
  Map<String, dynamic> toJson() {
    return {
      'phone_number': phoneNumber,
      'password': password,
    };
  }
}
