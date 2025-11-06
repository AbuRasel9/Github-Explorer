import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final _isDark = false.obs;

  bool get isDark => _isDark.value;

  ThemeMode get themeMode => _isDark.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDark.value = !_isDark.value;
    Get.changeThemeMode(themeMode);
  }
}
