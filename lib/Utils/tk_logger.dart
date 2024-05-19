import 'package:logger/web.dart';

class TkLogger {
  const TkLogger();

  static Logger logger = Logger(
    level: Level.all,
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );
  void trace({required dynamic data}) {
    logger.t(data);
  }

  void view({required dynamic data}) {
    logger.d(data);
  }

  void data({required dynamic data}) {
    logger.i(data);
  }

  void warning({required dynamic data}) {
    logger.w(data);
  }

  void error({required dynamic data}) {
    logger.e(data);
  }
}
