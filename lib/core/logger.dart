import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final log = _getLogger();
Logger _getLogger() {
  return Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      noBoxingByDefault: false,
    ),
    output: MultiOutput([
      if (!kReleaseMode) ConsoleOutput(),
    ]),
  );
}
