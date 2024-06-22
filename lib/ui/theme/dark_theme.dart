part of 'theme.dart';

  final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: ColorsDark.labelPrimary,
    secondary: ColorsDark.labelSecondary,
    tertiary: ColorsDark.labelTertiary,
    background: ColorsDark.backPrimary,
    surface: ColorsDark.backSecondary,
    surfaceTint: Colors.transparent,
  ),
  appBarTheme: const AppBarTheme(backgroundColor: ColorsDark.backPrimary),
  disabledColor: ColorsDark.labelDisable,
  dividerColor: ColorsDark.separator,
  switchTheme: SwitchThemeData(
    overlayColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return ColorsDark.overlay;
        }
        return Colors.white.withOpacity(.1);
      },
    ),
  ),
  dropdownMenuTheme: const DropdownMenuThemeData(
    menuStyle: MenuStyle(
      backgroundColor: MaterialStatePropertyAll(ColorsDark.backElevated),
    ),
  ),
  fontFamily: "Roboto",
  textTheme: _textTheme(),
);