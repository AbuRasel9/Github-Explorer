

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'configs/routes/routes_manager.dart';
import 'configs/routes/routes_name.dart';
import 'configs/theme/app_theme_data.dart';
import 'controller/theme_controller.dart';
void main()async {


  runApp(const MyApp()); // Running the application
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController()); // initialize GetX controller

    return  Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeController.themeMode, // Setting theme mode to dark
      theme: AppThemeData.lightThemeData, // Setting light theme
      darkTheme: AppThemeData.darkThemeData, // Setting dark theme      title: 'task',

      initialRoute: RoutesName.searchNameView,//initial route
      getPages: RouteManager.routes,
    ));
  }
}


