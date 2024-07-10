import 'package:flutter/material.dart';

import '../consts/colors.dart';

abstract class ThemeApp {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    shadowColor: ColorsApp.gray,
    colorScheme: const ColorScheme.light(
      secondary: ColorsApp.labelSecondary,
      tertiary: ColorsApp.labelTertiary,
      surface: ColorsApp.backSecondary,
      surfaceTint: Colors.transparent,
    ),
    scaffoldBackgroundColor: ColorsApp.backPrimary,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsApp.backPrimary,
      shadowColor: ColorsApp.gray,
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(ColorsApp.backElevated),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsApp.blue,
      foregroundColor: ColorsApp.white,
      shape: CircleBorder(),
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith ((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsApp.blue.withOpacity(0.5);
        }
        return ColorsApp.blue.withOpacity(0.2);
      }),
      trackOutlineColor: WidgetStatePropertyAll(
        ColorsApp.blue.withOpacity(0.01),
      ),
      thumbColor: const WidgetStatePropertyAll(ColorsApp.blue),
    ),
    checkboxTheme: const CheckboxThemeData(
      side: BorderSide(color: ColorsApp.gray, width: 2.0),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: ColorsApp.blue),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorsApp.blue,
      selectionColor: ColorsApp.blue,
      selectionHandleColor: ColorsApp.blue,
    ),
    dividerColor: ColorsApp.separator,
    fontFamily: "Roboto",
  );
}
