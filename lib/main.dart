import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rista_zoro_app/utils/constants/texts.dart';
import 'package:rista_zoro_app/utils/routes/app_routes.dart';
import 'package:rista_zoro_app/utils/routes/app_screens.dart';
import 'package:rista_zoro_app/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure initialization
  await GetStorage.init(); // Initialize GetStorage
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppTexts.appName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: AppScreens.splashScreen, // Set your initial route here
      getPages: AppRoutes.getPages(), // Use your AppRoutes class
    );
  }
}
