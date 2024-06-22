part of 'theme.dart';

abstract class _TextStyles {
  static const largeTitle = TextStyle(fontSize: 38.0, fontWeight: FontWeight.w500);
  static const  title = TextStyle(fontSize: 20.0, color: ColorsLight.labelTertiary);
  static const  button = TextStyle(fontSize: 14.0);
  static const  body = TextStyle(fontSize: 16.0);
  static const  subhead = TextStyle(fontSize: 14.0);
  static const  hint = TextStyle(fontSize: 16.0, color: ColorsLight.labelTertiary);
}

TextTheme _textTheme() {
  return const TextTheme(
    headlineSmall: _TextStyles.largeTitle,
    bodyMedium: _TextStyles.title,
    bodySmall: _TextStyles.hint,

  );
}
