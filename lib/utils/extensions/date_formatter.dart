import 'package:intl/intl.dart';

import '../s/s.dart';

extension DateFormatter on DateTime {
  String convertDateTimeToString() {
    return switch (S.languageCode) {
      'ru' => DateFormat('d MMMM y', 'ru').format(this),
      _ => DateFormat.yMMMMd().format(this),
    };
  }
}
