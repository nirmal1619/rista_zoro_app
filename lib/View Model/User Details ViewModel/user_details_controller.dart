import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/utils/constants/texts.dart';
import 'package:rista_zoro_app/utils/helpers/show_snackbar.dart';
import 'package:rista_zoro_app/utils/routes/app_screens.dart';
import 'package:rista_zoro_app/utils/storage/app_storage.dart';
import 'package:rista_zoro_app/utils/storage/app_storage_key.dart';

class UserDetailsController extends GetxController {
  // career details
  var degree = 'Select Degree'.obs;
  var isDegreeSelected = false.obs;

  var sector = 'Select Sector'.obs;
  var isSectorSelected = false.obs;

  var position = 'Your Position'.obs;
  var isPositionSelected = false.obs;

  var income = 'Select Income'.obs;
  var isIncomeSelected = false.obs;

  var workingExperience = "Select Experience".obs;
  var isExperienceSelected = false.obs;

  var companyController = TextEditingController();

  bool validateCareer() {
    return isDegreeSelected.value &&
        isSectorSelected.value &&
        isPositionSelected.value &&
        isIncomeSelected.value &&
        isExperienceSelected.value;
  }

  void goToSocialDetails() {
    if (!validateCareer()) {
      ShowSnackbar.errorMessage(
          AppTexts.missingFieldErrorP1, AppTexts.missingFieldErrorP2);
      return;
    }
    Get.toNamed(AppScreens.socialDetailsScreen);
  }

  // Social details
  var maritalStatus = 'Select Marital Status'.obs;
  var isMaritalStatusSelected = false.obs;

  var numberOfChildren = 'Select Number of Children'.obs;
  var isNumberOfChildrenSelected = false.obs;

  var religion = 'Select Religion'.obs;
  var isReligionSelected = false.obs;

  var caste = 'Select Caste'.obs;
  var isCasteSelected = false.obs;

  var manglik = 'Select Manglik Status'.obs;
  var isManglikSelected = false.obs;

  var motherTongue = "Select Mother Tongue".obs;
  var isMotherTongueSelected = false.obs;

  final neverMarried = true.obs;
  bool validateSocial() {
    return isMaritalStatusSelected.value &&
        (neverMarried.value || isNumberOfChildrenSelected.value) &&
        isReligionSelected.value &&
        isCasteSelected.value &&
        isManglikSelected.value &&
        isMotherTongueSelected.value;
  }

  void goToFamilyDetails() {
    if (!validateSocial()) {
      ShowSnackbar.errorMessage("Missing Data", "Fill all the '*' fields");
      return;
    }
    Get.toNamed(AppScreens.familyDetailsScreen);
  }

  // Family details
  var parentsStatus = 'Select Parents Status'.obs;
  var isParentsStatusSelected = false.obs;

  var siblings = 'Select Number of Siblings'.obs;
  var isSiblingsSelected = false.obs;

  var familyType = 'Select Family Type'.obs;
  var isFamilyTypeSelected = false.obs;

  // Add validation for Family details if needed
  bool validateFamily() {
    return isParentsStatusSelected.value &&
        isSiblingsSelected.value &&
        isFamilyTypeSelected.value;
  }

  void goToAddressDetails() {
    if (!validateFamily()) {
      ShowSnackbar.errorMessage(
          AppTexts.missingFieldErrorP1, AppTexts.missingFieldErrorP2);
    }
    Get.toNamed(AppScreens.addressDetailsScreen);
  }

  var addressController = TextEditingController();
  // Address details
  var country = 'Select Country'.obs;
  var isCountrySelected = false.obs;

  var state = 'Select State'.obs;
  var isStateSelected = false.obs;

  var city = 'Select City'.obs;
  var isCitySelected = false.obs;

  var showAddress = false.obs;

  bool validateAddress() {
    return isCountrySelected.value &&
        isStateSelected.value &&
        isCitySelected.value;
  }

  void goToHomeScreen() {
    if (!validateAddress()) {
      ShowSnackbar.errorMessage(
          AppTexts.missingFieldErrorP1, AppTexts.missingFieldErrorP2);
      return;
    }
    AppStorage.writeData(AppStorageKey.allDetailsAdded, true);
    Get.offAllNamed(AppScreens.naviMenuScreen);
    // Navigate to the next screen
  }
}
