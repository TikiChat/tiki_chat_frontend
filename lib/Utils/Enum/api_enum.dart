// ignore_for_file: constant_identifier_names

enum ApiPathEnum {
  USER_SEARCH('/api/v1/users/search');

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
