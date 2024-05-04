// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum FontWeightEnum {
  BOLD(FontWeight.w700),
  SEMI_BOLD(FontWeight.w600),
  MEDIUM(FontWeight.w500),
  REGULAR(FontWeight.w400);

  const FontWeightEnum(this.fontWeight);

  final FontWeight fontWeight;
}

enum SocialEnum {
  KAKAO("카톡"),
  NAVER("네이버"),
  GOOGLE("구글");

  const SocialEnum(this.text);

  final String text;
}

enum BreakPointEnum {
  MOBILE(600),
  MINITABLET(700),
  ROTATE(800),
  SMALLTABLET(1024);

  const BreakPointEnum(this.size);

  final int size;
}

enum ButtonEnum { RADIUS, OUTLINE }

enum InputValidateEnum { EMAIL, PHONE, NICKNAME, PWD, PWD_CONFIRM }
