import 'package:logger/logger.dart';

final logger = Logger(
  filter: DevelopmentFilter(),
  printer: PrettyPrinter(),
  output: ConsoleOutput(),
);

extension CountLog on Logger {
  static int counter = 0;

  static count(String text) {
    logger.i('$counter) $text');
    counter++;
  }
}
