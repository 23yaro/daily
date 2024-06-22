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
  disabledColor: ColorsLight.labelDisable,
  dividerColor: ColorsLight.separator,
  switchTheme: SwitchThemeData(
    overlayColor: MaterialStateProperty.resolveWith(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return ColorsLight.overlay;
        }
        return Colors.white.withOpacity(.1);
      },
    ),
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
  hintColor: ColorsLight.labelTertiary,
  fontFamily: "Roboto",
  textTheme: _textTheme(),
);
