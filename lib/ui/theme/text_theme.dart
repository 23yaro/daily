part of 'theme.dart';

abstract class _TextStyles {
  static const title = TextStyle(fontSize: 16.0);
  static const subhead =
      TextStyle(fontSize: 16.0, color: ColorsLight.labelTertiary);
  static const button = TextStyle(fontSize: 16);
}

TextTheme _textTheme() {
  return const TextTheme(
    bodyMedium: _TextStyles.title,
    bodySmall: _TextStyles.subhead,
    labelLarge: _TextStyles.button,
  );
}
