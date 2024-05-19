// ignore_for_file: constant_identifier_names

enum ErrorStatusEnum {
  // Common
  INTERNAL_SERVER_ERROR(500, "C001", "internal server error"),
  INVALID_INPUT_VALUE(400, "C002", "입력 값이 유효하지 않습니다."),
  METHOD_NOT_ALLOWED(405, "C003", "허용되지 않은 METHOD 호출입니다."),
  INVALID_TYPE_VALUE(400, "C004", "invalid type value"),
  BAD_CREDENTIALS(400, "C005", "bad credentials"),
  UNKNOWN_ERROR(500, 'T000', "알 수 없는 에러가 발생하였습니다."),

  // Auth
  INVALID_JSON_WEB_TOKEN(400, "A001", "유효하지 않은 토큰입니다."),
  CHECK_EMAIL_OR_PASSWORD(400, "A002", "이메일 또는 비밀번호를 다시 확인해주세요."),
  MISSING_DEVICE_ID(400, "A003", "요청 헤더에 Device-ID 정보가 포함되지 않았습니다."),
  EMAIL_NOT_FOUND(404, "A004", "이메일을 찾지 못했습니다."),
  INVALID_EMAIL_VERIFICATION_CODE(400, "A005", "유효하지 않은 인증코드입니다."),

  // Terms
  REQUIRED_TERMS_NOT_AGREED(400, "T001", "요청에 필수 약관 정보를 모두 포함시켜 주세요."),
  TERMS_NOT_FOUND(404, "T002", "대상 약관을 찾을 수 없습니다."),

  // User
  ALREADY_SIGNED_UP_USER(409, "U001", "같은 이메일로 이미 가입한 계정이 있습니다."),
  NICKNAME_ALREADY_IN_USE(409, "U002", "이미 사용 중인 닉네임입니다."),
  REGISTERED_USER_NOT_FOUND(404, "U003", "가입된 계정을 찾을 수 없습니다."),
  SOCIAL_EMAIL_MISMATCH(400, "U004", "계정의 이메일과 소셜 연동 정보의 이메일이 일치하지 않습니다."),
  UNAUTHORIZED_ACCOUNT_ATTEMPT(403, "U005", "요청한 계정과 로그인 사용자가 일치하지 않습니다."),
  USER_NOT_LINKED_WITH_SOCIAL(400, "U006", "이미 가입한 계정이 있습니다. 로그인을 통해 소셜 계정과 연동하세요.");

  const ErrorStatusEnum(this.status, this.code, this.message);
  final int status;
  final String code;
  final String message;
}
