import 'package:tikichat_app/Utils/Enum/error_enum.dart';

class TkException implements Exception {
  final int status;
  final String message;
  TkException(this.status, this.message);

  @override
  String toString() {
    final result = ErrorStatusEnum.values.firstWhere((element) => element.status == status,
        orElse: () => ErrorStatusEnum.UNKNOWN_ERROR);
    if (result.message == message) return message;
    return "${result.message}\n$message";
  }
}
