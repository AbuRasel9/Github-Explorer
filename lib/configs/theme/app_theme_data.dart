import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_color_schemes.dart';
import 'app_text_themes.dart';


class AppThemeData {
  // --------------------------------------
// Light Theme Data
// --------------------------------------
  static final lightThemeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: CupertinoColors.systemGrey6,
    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      color: AppColorSchemes.lightColorScheme.surface,
      margin: EdgeInsets.zero,
    ),
    colorScheme: AppColorSchemes.lightColorScheme,
    textTheme: AppTextThemes.lightTextTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorSchemes.lightColorScheme.primary,
      foregroundColor: AppColorSchemes.lightColorScheme.onPrimary,
      elevation: 0,
      titleTextStyle: AppTextThemes.lightTextTheme.titleLarge
          ?.copyWith(color: AppColorSchemes.lightColorScheme.onPrimary),
      iconTheme: IconThemeData(
        color: AppColorSchemes.lightColorScheme.onPrimary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(1),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            return states.contains(WidgetState.disabled)
                ? AppColorSchemes.lightColorScheme.outline.withOpacity(0.5)
                : AppColorSchemes.lightColorScheme.primary;
          },
        ),
        foregroundColor: WidgetStatePropertyAll(AppColorSchemes.lightColorScheme.onPrimary),
        shadowColor: const WidgetStatePropertyAll(Colors.transparent),
        textStyle: WidgetStatePropertyAll(
          AppTextThemes.lightTextTheme.titleMedium
              ?.copyWith(color: AppColorSchemes.lightColorScheme.onTertiary),
        ),
        overlayColor: WidgetStateProperty.resolveWith(
          (states) {
            return states.contains(WidgetState.pressed)
                ? AppColorSchemes.lightColorScheme.tertiary.withOpacity(0.2)
                : null;
          },
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      hintStyle: AppTextThemes.lightTextTheme.bodyMedium?.copyWith(
        color: AppColorSchemes.lightColorScheme.outline.withOpacity(0.5),
      ),
      errorStyle: AppTextThemes.lightTextTheme.labelMedium?.copyWith(
        color: AppColorSchemes.lightColorScheme.error,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(

          color: AppColorSchemes.lightColorScheme.outline.withOpacity(0.5),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColorSchemes.lightColorScheme.outline.withOpacity(0.5),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColorSchemes.lightColorScheme.outline.withOpacity(.5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColorSchemes.lightColorScheme.outline ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColorSchemes.lightColorScheme.error),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      labelStyle: AppTextThemes.lightTextTheme.bodyMedium?.copyWith(
        color: AppColorSchemes.lightColorScheme.outline.withOpacity(0.7),
      ),
      prefixIconColor: WidgetStateColor.resolveWith(
        (states) {
          return states.contains(WidgetState.focused)
              ? AppColorSchemes.lightColorScheme.onSurface
              : AppColorSchemes.lightColorScheme.outline.withOpacity(0.7);
        },
      ),
      suffixIconColor: WidgetStateColor.resolveWith(
        (states) {
          return states.contains(WidgetState.focused)
              ? AppColorSchemes.lightColorScheme.onSurface
              : AppColorSchemes.lightColorScheme.outline.withOpacity(0.7);
        },
      ),
    ),
  );

// --------------------------------------
// Dark Theme Data
// --------------------------------------
  static final darkThemeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: AppColorSchemes.darkColorScheme,
    textTheme: AppTextThemes.darkTextTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: AppTextThemes.darkTextTheme.titleLarge
          ?.copyWith(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
    ),

    cardTheme: CardThemeData(
      color: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      margin: EdgeInsets.zero,
      elevation: 2,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.disabled)
              ? Colors.grey.shade700
              : AppColorSchemes.darkColorScheme.primary,
        ),
        foregroundColor:
        WidgetStatePropertyAll(AppColorSchemes.darkColorScheme.onPrimary),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        textStyle: WidgetStatePropertyAll(
          AppTextThemes.darkTextTheme.titleMedium
              ?.copyWith(color: Colors.white),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: const Color(0xFF1E1E1E),
      hintStyle: TextStyle(
        color: AppColorSchemes.darkColorScheme.outline.withOpacity(0.6),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:
        BorderSide(color: AppColorSchemes.darkColorScheme.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:
        BorderSide(color: AppColorSchemes.darkColorScheme.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:
        BorderSide(color: AppColorSchemes.darkColorScheme.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:
        BorderSide(color: AppColorSchemes.darkColorScheme.error),
      ),
    ),

    iconTheme: const IconThemeData(color: Colors.white70),
  );
}

