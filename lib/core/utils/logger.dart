import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

final logger = Logger(
  printer: PrettyPrinter(colors: true, printEmojis: true),
  level: kDebugMode ? Level.debug : Level.off,
);
