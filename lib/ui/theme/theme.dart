import 'package:flutter/material.dart';

import '../consts/colors.dart';

abstract class ThemeApp {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    shadowColor: ColorsApp.gray,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.dark,
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
      trackColor: WidgetStateProperty.resolveWith((states) {
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
    listTileTheme: const ListTileThemeData(
      subtitleTextStyle: TextStyle(
        fontSize: 14.0,
        color: ColorsApp.labelTertiary,
      ),
    ),
    hintColor: ColorsApp.labelTertiary,
    dividerColor: ColorsApp.separator,
    fontFamily: "Roboto",
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: ColorsApp.blue),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    shadowColor: ColorsDark.gray,
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      secondary: ColorsDark.labelSecondary,
      tertiary: ColorsDark.labelTertiary,
      surface: ColorsDark.backSecondary,
      surfaceTint: Colors.transparent,
    ),
    scaffoldBackgroundColor: ColorsDark.backPrimary,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsDark.backPrimary,
      shadowColor: ColorsDark.gray,
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(ColorsDark.backElevated),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsDark.blue,
      foregroundColor: ColorsDark.white,
      shape: CircleBorder(),
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsDark.blue.withOpacity(0.5);
        }
        return ColorsDark.blue.withOpacity(0.2);
      }),
      trackOutlineColor: WidgetStatePropertyAll(
        ColorsDark.blue.withOpacity(0.01),
      ),
      thumbColor: const WidgetStatePropertyAll(ColorsDark.blue),
    ),
    checkboxTheme: const CheckboxThemeData(
      side: BorderSide(color: ColorsDark.gray, width: 2.0),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: ColorsDark.blue),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorsDark.blue,
      selectionColor: ColorsDark.blue,
      selectionHandleColor: ColorsDark.blue,
    ),
    listTileTheme: const ListTileThemeData(
      subtitleTextStyle: TextStyle(
        fontSize: 14.0,
        color: ColorsDark.labelTertiary,
      ),
    ),
    hintColor: ColorsDark.labelTertiary,
    dividerColor: ColorsDark.separator,
    fontFamily: "Roboto",
    progressIndicatorTheme:
    const ProgressIndicatorThemeData(color: ColorsDark.blue),
  );
}
