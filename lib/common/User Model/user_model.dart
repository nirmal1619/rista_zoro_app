class User {
  int aldId;
  String aldFname;
  String aldUsrnameemp;
  String aldLname;
  String aldContact1;
  String aldContact2;
  String aldContact3;
  String gender;
  String maritalStatus;
  String dob;
  String aldWhatsappContact;
  String aldEmai1;
  String aldEmail2;
  String aldAddr1;
  String aldAddr2;
  String aldCity;
  String aldState;
  String aldPincode;
  String aldWebsiteurl;
  String aldAboutprofile;
  String aldMarqui;
  String aldDisclaimer;
  String profileTrmCond;
  String profileCancePrivacy;
  String profilePrivacyPolicy;
  String aldFacebookurl;
  String aldLinkdineurl;
  String aldGoogleplusurl;
  String aldTwiterurl;
  String aldInstagramurl;
  String aldImage;
  String aldUsrname;
  String aldPassword;
  int aldDate;
  String aldHomeTitle;
  String aldHomeKeword;
  String aldHomeDisc;
  String aldAboutTitle;
  String aldAboutKeword;
  String aldAboutDisc;
  String aldPropertydetlTitle;
  String aldPropertydetlKeword;
  String aldPropertydeltDisc;
  String aldProjTitle;
  String aldProjKeword;
  String aldProjDisc;
  String aldPostpropertyTitle;
  String aldPostpropertyKeword;
  String aldPostproperyDisc;

  User({
    required this.aldId,
    required this.aldFname,
    required this.aldUsrnameemp,
    required this.aldLname,
    required this.aldContact1,
    required this.aldContact2,
    required this.aldContact3,
    required this.gender,
    required this.maritalStatus,
    required this.dob,
    required this.aldWhatsappContact,
    required this.aldEmai1,
    required this.aldEmail2,
    required this.aldAddr1,
    required this.aldAddr2,
    required this.aldCity,
    required this.aldState,
    required this.aldPincode,
    required this.aldWebsiteurl,
    required this.aldAboutprofile,
    required this.aldMarqui,
    required this.aldDisclaimer,
    required this.profileTrmCond,
    required this.profileCancePrivacy,
    required this.profilePrivacyPolicy,
    required this.aldFacebookurl,
    required this.aldLinkdineurl,
    required this.aldGoogleplusurl,
    required this.aldTwiterurl,
    required this.aldInstagramurl,
    required this.aldImage,
    required this.aldUsrname,
    required this.aldPassword,
    required this.aldDate,
    required this.aldHomeTitle,
    required this.aldHomeKeword,
    required this.aldHomeDisc,
    required this.aldAboutTitle,
    required this.aldAboutKeword,
    required this.aldAboutDisc,
    required this.aldPropertydetlTitle,
    required this.aldPropertydetlKeword,
    required this.aldPropertydeltDisc,
    required this.aldProjTitle,
    required this.aldProjKeword,
    required this.aldProjDisc,
    required this.aldPostpropertyTitle,
    required this.aldPostpropertyKeword,
    required this.aldPostproperyDisc,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      aldId: json['ald_id'] is int ? json['ald_id'] : int.parse(json['ald_id']),
      aldFname: json['ald_fname'] ?? '',
      aldUsrnameemp: json['ald_usrnameemp'] ?? '',
      aldLname: json['ald_lname'] ?? '',
      aldContact1: json['ald_contact1'] ?? '',
      aldContact2: json['ald_contact2'] ?? '',
      aldContact3: json['ald_contact3'] ?? '',
      gender: json['gender'] ?? '',
      maritalStatus: json['marital_status'] ?? '',
      dob: json['dob'] ?? '',
      aldWhatsappContact: json['ald_whatsapp_contact'] ?? '',
      aldEmai1: json['ald_emai1'] ?? '',
      aldEmail2: json['ald_email2'] ?? '',
      aldAddr1: json['ald_addr1'] ?? '',
      aldAddr2: json['ald_addr2'] ?? '',
      aldCity: json['ald_city'] ?? '',
      aldState: json['ald_state'] ?? '',
      aldPincode: json['ald_pincode'] ?? '',
      aldWebsiteurl: json['ald_websiteurl'] ?? '',
      aldAboutprofile: json['ald_aboutprofile'] ?? '',
      aldMarqui: json['ald_marqui'] ?? '',
      aldDisclaimer: json['ald_disclaimer'] ?? '',
      profileTrmCond: json['profile_trm_cond'] ?? '',
      profileCancePrivacy: json['profile_cance_privacy'] ?? '',
      profilePrivacyPolicy: json['profile_privacy_policy'] ?? '',
      aldFacebookurl: json['ald_facebookurl'] ?? '',
      aldLinkdineurl: json['ald_linkdineurl'] ?? '',
      aldGoogleplusurl: json['ald_googleplusurl'] ?? '',
      aldTwiterurl: json['ald_twiterurl'] ?? '',
      aldInstagramurl: json['ald_instagramurl'] ?? '',
      aldImage: json['ald_image'] ?? '',
      aldUsrname: json['ald_usrname'] ?? '',
      aldPassword: json['ald_password'] ?? '',
      aldDate: json['ald_date'] is int
          ? json['ald_date']
          : int.parse(json['ald_date']),
      aldHomeTitle: json['ald_home_title'] ?? '',
      aldHomeKeword: json['ald_home_keword'] ?? '',
      aldHomeDisc: json['ald_home_disc'] ?? '',
      aldAboutTitle: json['ald_about_title'] ?? '',
      aldAboutKeword: json['ald_about_keword'] ?? '',
      aldAboutDisc: json['ald_about_disc'] ?? '',
      aldPropertydetlTitle: json['ald_propertydetl_title'] ?? '',
      aldPropertydetlKeword: json['ald_propertydetl_keword'] ?? '',
      aldPropertydeltDisc: json['ald_propertydelt_disc'] ?? '',
      aldProjTitle: json['ald_proj_title'] ?? '',
      aldProjKeword: json['ald_proj_keword'] ?? '',
      aldProjDisc: json['ald_proj_disc'] ?? '',
      aldPostpropertyTitle: json['ald_postproperty_title'] ?? '',
      aldPostpropertyKeword: json['ald_postproperty_keword'] ?? '',
      aldPostproperyDisc: json['ald_postpropery_disc'] ?? '',
    );
  }

  @override
  String toString() {
    return 'User(aldId: $aldId, aldFname: $aldFname, aldUsrnameemp: $aldUsrnameemp, aldLname: $aldLname, aldContact1: $aldContact1, aldContact2: $aldContact2, aldContact3: $aldContact3, gender: $gender, maritalStatus: $maritalStatus, dob: $dob, aldWhatsappContact: $aldWhatsappContact, aldEmai1: $aldEmai1, aldEmail2: $aldEmail2, aldAddr1: $aldAddr1, aldAddr2: $aldAddr2, aldCity: $aldCity, aldState: $aldState, aldPincode: $aldPincode, aldWebsiteurl: $aldWebsiteurl, aldAboutprofile: $aldAboutprofile, aldMarqui: $aldMarqui, aldDisclaimer: $aldDisclaimer, profileTrmCond: $profileTrmCond, profileCancePrivacy: $profileCancePrivacy, profilePrivacyPolicy: $profilePrivacyPolicy, aldFacebookurl: $aldFacebookurl, aldLinkdineurl: $aldLinkdineurl, aldGoogleplusurl: $aldGoogleplusurl, aldTwiterurl: $aldTwiterurl, aldInstagramurl: $aldInstagramurl, aldImage: $aldImage, aldUsrname: $aldUsrname, aldPassword: $aldPassword, aldDate: $aldDate, aldHomeTitle: $aldHomeTitle, aldHomeKeword: $aldHomeKeword, aldHomeDisc: $aldHomeDisc, aldAboutTitle: $aldAboutTitle, aldAboutKeword: $aldAboutKeword, aldAboutDisc: $aldAboutDisc, aldPropertydetlTitle: $aldPropertydetlTitle, aldPropertydetlKeword: $aldPropertydetlKeword, aldPropertydeltDisc: $aldPropertydeltDisc, aldProjTitle: $aldProjTitle, aldProjKeword: $aldProjKeword, aldProjDisc: $aldProjDisc, aldPostpropertyTitle: $aldPostpropertyTitle, aldPostpropertyKeword: $aldPostpropertyKeword, aldPostproperyDisc: $aldPostproperyDisc)';
  }

  Map<String, dynamic> toJson() {
    return {
      'ald_id': aldId,
      'ald_fname': aldFname,
      'ald_usrnameemp': aldUsrnameemp,
      'ald_lname': aldLname,
      'ald_contact1': aldContact1,
      'ald_contact2': aldContact2,
      'ald_contact3': aldContact3,
      'gender': gender,
      'marital_status': maritalStatus,
      'dob': dob,
      'ald_whatsapp_contact': aldWhatsappContact,
      'ald_emai1': aldEmai1,
      'ald_email2': aldEmail2,
      'ald_addr1': aldAddr1,
      'ald_addr2': aldAddr2,
      'ald_city': aldCity,
      'ald_state': aldState,
      'ald_pincode': aldPincode,
      'ald_websiteurl': aldWebsiteurl,
      'ald_aboutprofile': aldAboutprofile,
      'ald_marqui': aldMarqui,
      'ald_disclaimer': aldDisclaimer,
      'profile_trm_cond': profileTrmCond,
      'profile_cance_privacy': profileCancePrivacy,
      'profile_privacy_policy': profilePrivacyPolicy,
      'ald_facebookurl': aldFacebookurl,
      'ald_linkdineurl': aldLinkdineurl,
      'ald_googleplusurl': aldGoogleplusurl,
      'ald_twiterurl': aldTwiterurl,
      'ald_instagramurl': aldInstagramurl,
      'ald_image': aldImage,
      'ald_usrname': aldUsrname,
      'ald_password': aldPassword,
      'ald_date': aldDate,
      'ald_home_title': aldHomeTitle,
      'ald_home_keword': aldHomeKeword,
      'ald_home_disc': aldHomeDisc,
      'ald_about_title': aldAboutTitle,
      'ald_about_keword': aldAboutKeword,
      'ald_about_disc': aldAboutDisc,
      'ald_propertydetl_title': aldPropertydetlTitle,
      'ald_propertydetl_keword': aldPropertydetlKeword,
      'ald_propertydelt_disc': aldPropertydeltDisc,
      'ald_proj_title': aldProjTitle,
      'ald_proj_keword': aldProjKeword,
      'ald_proj_disc': aldProjDisc,
      'ald_postproperty_title': aldPostpropertyTitle,
      'ald_postproperty_keword': aldPostpropertyKeword,
      'ald_postpropery_disc': aldPostproperyDisc,
    };
  }
}
