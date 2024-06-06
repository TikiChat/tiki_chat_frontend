// ignore_for_file: constant_identifier_names

enum ApiPathEnum {
  USER_SEARCH('/api/v1/users/search'),
  SEND_AUTHCODE("/api/v1/auth/send-certification"),
  NORMAL_SIGNUP("/api/v1/users/signup/normal"),
  AGREE_TERM("/api/v1/terms/latest"),
  LOGIN("/api/v1/auth/login"),
  USER("/api/v1/users"),
  SOCIAL_LOGIN("/api/v1/auth/social/login"),
  AUTH_VERIFY("/api/v1/auth/verify");

  const ApiPathEnum(this.path);

  final String path;
}

enum ApiTypeEnum {
  GET,
  DELETE,
  POST,
  PUT,
  GET_FILE,
  POST_FILE,
  PUT_FILE,
}
