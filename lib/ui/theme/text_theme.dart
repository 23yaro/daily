part of 'theme.dart';

abstract class _TextStyles {
  static const largeTitle = TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w500,
      color: ColorsLight.labelPrimary);
  static const title =
      TextStyle(fontSize: 20.0, color: ColorsLight.labelTertiary);
  static const subhead =
      TextStyle(fontSize: 16.0, color: ColorsLight.labelTertiary);
  static const button = TextStyle(fontSize: 16);
}

TextTheme _textTheme() {
  return const TextTheme(
    headlineSmall: _TextStyles.largeTitle,
    bodyMedium: _TextStyles.title,
    bodySmall: _TextStyles.subhead,
    labelLarge: _TextStyles.button,
  );
}
