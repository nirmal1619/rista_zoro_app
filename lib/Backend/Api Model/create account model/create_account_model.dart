class CreateAccountModel {
  final String aldFname;
  final String aldLname;
  final String dob;
  final String gender;
  final String aldPassword;
  final String phone;
  final String aldEmail;
  final String profileFor; // New field added
  final String height; // New field added

  CreateAccountModel({
    required this.aldFname,
    required this.aldLname,
    required this.dob,
    required this.gender,
    required this.aldPassword,
    required this.phone,
    required this.aldEmail,
    required this.profileFor, // New field added
    required this.height, // New field added
  });

  // Convert the model to a map for sending as POST data
  Map<String, dynamic> toJson() {
    return {
      'profile_for': profileFor,
      'ald_fname': aldFname,
      'ald_lname': aldLname,
      'dob': dob,
      'gender': gender,
      'ald_password': aldPassword,
      'phone': phone,
      'ald_email': aldEmail,
      'height': height, // Include new field in JSON
    };
  }
}
