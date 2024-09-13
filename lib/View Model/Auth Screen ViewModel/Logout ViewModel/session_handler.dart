import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/utils/helpers/show_toast.dart';

import '../../../utils/dailog/app_dialog.dart';
import '../../../utils/routes/app_screens.dart';
import '../../../utils/storage/app_storage.dart';
import '../../../utils/storage/app_storage_key.dart';

class SessionHandler {
  static Future<void> logout() async {
    await AppStorage.removeData(AppStorageKey.isLogin);
    await AppStorage.removeData(AppStorageKey.isFirstTime);
    await AppStorage.removeData(AppStorageKey.allDetailsAdded);

    ShowToast.message("Logout", Get.overlayContext!);
  }

  static void askedForLogOut(BuildContext context) {
    AppDialog.showAlertDialog(
        context: context,
        warningMessage: "Do you want to log out",
        firstButtonName: "Log Out",
        secondButtonName: "Cancel",
        onFirstButtonPressed: () async {
          logout();
          // Navigate to splash screen

          Get.offAllNamed(AppScreens.splashScreen);
        },
        onSecondButtonPressed: () {});
  }
}
