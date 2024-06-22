part of 'theme.dart';

final ThemeData lightTheme = ThemeData(
  shadowColor: ColorsLight.gray,
  colorScheme: const ColorScheme.light(
    secondary: ColorsLight.labelSecondary,
    tertiary: ColorsLight.labelTertiary,
    background: ColorsLight.backPrimary,
    surface: ColorsLight.backSecondary,
    surfaceTint: Colors.transparent,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorsLight.backPrimary,
    shadowColor: ColorsLight.gray,
  ),
  dropdownMenuTheme: const DropdownMenuThemeData(
    menuStyle: MenuStyle(
      backgroundColor: MaterialStatePropertyAll(ColorsLight.backElevated),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: ColorsLight.blue,
    foregroundColor: ColorsLight.white,
    shape: CircleBorder(),
  ),
  switchTheme: SwitchThemeData(
    trackColor: MaterialStatePropertyAll(ColorsLight.blue.withOpacity(0.3)),
    trackOutlineColor:
        MaterialStatePropertyAll(ColorsLight.blue.withOpacity(0.01)),
    thumbColor: const MaterialStatePropertyAll(ColorsLight.blue),
  ),
  checkboxTheme: const CheckboxThemeData(
      side: BorderSide(color: ColorsLight.gray, width: 2.0)),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: ColorsLight.blue)),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: ColorsLight.blue,
    selectionColor: ColorsLight.blue,
    selectionHandleColor: ColorsLight.blue,
  ),
  fontFamily: "Roboto",
  textTheme: _textTheme(),
);
