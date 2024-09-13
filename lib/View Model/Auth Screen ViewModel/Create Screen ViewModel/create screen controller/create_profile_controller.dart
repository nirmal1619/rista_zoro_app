import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/Backend/Api%20Model/create%20account%20model/create_account_model.dart';
import 'package:rista_zoro_app/Backend/Api%20Repository/create_profile_repo.dart';
import 'package:rista_zoro_app/Backend/Api%20utils/Api%20Helpers/api_helper.dart';
import 'package:rista_zoro_app/utils/helpers/show_snackbar.dart';
import 'package:rista_zoro_app/utils/helpers/show_toast.dart';
import 'package:rista_zoro_app/utils/storage/app_storage_method.dart';

import '../../../../utils/routes/app_screens.dart';

class CreateProfileController extends GetxController {
  final createProfileFor = "".obs;
  final dataofBirth = "".obs;
  final selectedGender = "Male".obs;

  // Add TextEditingControllers for each text field
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final heightController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Add a GlobalKey for the Form
  final createProfileFormKey = GlobalKey<FormState>().obs;

  // Observable variables for gender selection and other states
  final isMale = true.obs;
  final isFemale = false.obs;
  final acceptPolicy = true.obs;

  final isDateAvailable = false.obs;
  final showPassword = false.obs;
  final showDateError = false.obs;
  final isLoading = false.obs;

  // Toggle gender selection, ensuring only one is selected at a time
  void selectGender(bool maleSelected) {
    if (maleSelected) {
      isMale.value = true;
      isFemale.value = false;
      selectedGender.value = "male";
    } else {
      isMale.value = false;
      isFemale.value = true;
      selectedGender.value = "Female";
    }
  }

  // Toggle the visibility of the password
  void togglePasswordVisibility() {
    showPassword.value = !showPassword.value;
  }

  void toggleAcceptPolicy() {
    acceptPolicy.value = !acceptPolicy.value;
  }

  // Function to validate the form
  bool validate() {
    if (!createProfileFormKey.value.currentState!.validate() &&
        !isDateAvailable.value) {
      if (!isDateAvailable.value) {
        showDateError.value = true;
        return false;
      }
      ShowSnackbar.warningMessage("Missing Details", "Fill all the details");
      return false;
    }
    if (!isDateAvailable.value) {
      showDateError.value = true;
      return false;
    }
    if (!acceptPolicy.value) {
      ShowSnackbar.warningMessage("Privacy Policy", "Accept Privacy Policy");
      return false;
    }

    return true;
    // Additional logic after validation
  }

  //create account
  Future<void> createAccount() async {
    if (!validate()) {
      ShowSnackbar.errorMessage("Fields", "Fill all the fields");
      return;
    }
    CreateAccountModel accountModel = CreateAccountModel(
        aldFname: firstNameController.text,
        aldLname: lastNameController.text,
        dob: dataofBirth.value,
        gender: selectedGender.value,
        aldPassword: passwordController.text,
        phone: mobileNumberController.text,
        aldEmail: emailController.text,
        profileFor: createProfileFor.value,
        height: heightController.text);
    isLoading.value = true;
    try {
      CreateProfileRepo repo = CreateProfileRepo();

      var response = await repo.createAccount(accountModel);

      log(response["data"].toString());

      if (response['result'] == 1 && response['msg'] == 'Success Register') {
        //store data in local storage
        AppStorageMethod.saveDataAtCreateProfileScreen();
        // go to next screen
        Get.toNamed(AppScreens.otpScreen);
        //show login message
        ShowToast.message("Successfully Register", Get.context!);
      }

      // Check if the response indicates that the account is already registered
      if (response['result'] == 0 && response['msg'] == 'Already Register') {
        ShowSnackbar.warningMessage(
            "Already Registered", "Your account is already registered.");
      } else {
        print(response.toString());
      }
    } catch (e) {
      if (e is Exception) {
        ApiHelpers.handleException(e);
      } else {
        ShowSnackbar.errorMessage(
            'Unexpected Error', 'An unexpected error occurred.');
      }
      log('Error creating account: $e');
    } finally {
      isLoading.value = !true;
    }
  }

  // Dispose of the controllers when the controller is destroyed
  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    heightController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
