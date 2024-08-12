import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rista_zoro_app/View/Authentication/screens/Create%20Profile%20Screen/screens/select_person_screen.dart';
import 'package:rista_zoro_app/utils/constants/texts.dart';
import 'package:rista_zoro_app/utils/theme/theme.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
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
      home: SelectPersonScreen(),
    );
  }
}
