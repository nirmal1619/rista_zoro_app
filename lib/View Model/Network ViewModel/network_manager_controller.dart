import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkManagerController extends GetxController {
  static NetworkManagerController get instance =>
      Get.find<NetworkManagerController>();

  late StreamSubscription<InternetStatus> listener;
  Rx<bool> isConnectedToInternet = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkInternetConnection();
  }

  bool checkInternetConnection() {
    listener =
        InternetConnection().onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          isConnectedToInternet.value = true;

          break;
        case InternetStatus.disconnected:
          isConnectedToInternet.value = false;

          break;
      }
    });
    return isConnectedToInternet.value;
  }

  @override
  void onClose() {
    listener.cancel();
    super.onClose();
  }
}
