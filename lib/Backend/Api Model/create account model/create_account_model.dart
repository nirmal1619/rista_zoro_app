class CreateAccountModel {
  final String aldFname;
  final String aldLname;
  final String dob;
  final String gender;
  final String religion;
  final String motherTongue;
  final String aldPassword;
  final String phone;
  final String aldEmail;

  CreateAccountModel({
    required this.aldFname,
    required this.aldLname,
    required this.dob,
    required this.gender,
    required this.religion,
    required this.motherTongue,
    required this.aldPassword,
    required this.phone,
    required this.aldEmail,
  });

  // Convert the model to a map for sending as POST data
  Map<String, dynamic> toJson() {
    return {
      'ald_fname': aldFname,
      'ald_lname': aldLname,
      'dob': dob,
      'gender': gender,
      'religion': religion,
      'mothertongue': motherTongue,
      'ald_password': aldPassword,
      'phone': phone,
      'ald_emai1': aldEmail,
    };
  }
}
