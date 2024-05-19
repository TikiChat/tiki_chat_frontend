// ignore_for_file: constant_identifier_names

enum RouterPathEnum {
  SPLASH("/"),
  SIGNIN("/signin"),
  SIGNUP("/signup"),
  AGREE("/agree"),
  NICKNAME("/nickname"),
  CONFIRM("/confirm"),
  EMAIL_AUTH("/emailAuth"),
  PWD_CONFIG("/pwdConfig"),
  NO_ACCOUNT("/noAccount"),
  NO_PASSWORD("/noPassword"),
  PASSWORD("/password"),
  HOME("/home"),
  SIGNOUT("/signout");

  const RouterPathEnum(this.path);

  final String path;
}
