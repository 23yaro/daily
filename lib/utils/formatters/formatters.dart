import 'package:intl/intl.dart';

import '../s/s.dart';

abstract class Formatters {
  static String convertDateTimeToString(DateTime dateTime) {
    return switch (S.languageCode) {
      'ru' => DateFormat('d MMMM y', 'ru').format(dateTime),
      _ => DateFormat.yMMMMd().format(dateTime),
    };
  }
}
