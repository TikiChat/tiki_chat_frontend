import 'package:flutter/material.dart';
import 'package:tikichat_app/Utils/Theme/color.dart';
import 'package:tikichat_app/Utils/Theme/text_style.dart';

extension ThemeServiceExt on BuildContext {
  CuTextStyles get textStyle => CuTextStyles();
  CuColor get colors => CuColor();
}
