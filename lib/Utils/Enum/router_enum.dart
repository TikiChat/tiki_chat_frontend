// ignore_for_file: constant_identifier_names

enum RouterPathEnum {
  SPLASH("/"),
  SIGNIN("/signin"),
  SIGNUP("/signup"),
  AGREE("/agree"),
  NICKNAME("/nickname"),
  CONFIRM("/confirm"),
  EMAIL_AUTH("/emailAuth/:email"),
  PWD_CONFIG("/pwdConfig"),
  NO_ACCOUNT("/noAccount"),
  NO_PASSWORD("/noPassword"),
  SIGNOUT("/signout");

  const RouterPathEnum(this.path);

  final String path;
}
