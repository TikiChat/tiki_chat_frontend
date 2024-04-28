import 'package:size_setter/size_setter.dart';
import 'package:tikichat_app/Utils/Enum/common_enum.dart';
import 'package:tikichat_app/Utils/constants.dart';

double getTextSize(num size) {
  return textScale
      .scale(getSizeByScreen(mobile: size.sp, smallTablet: size.px, rotateTablet: size.px));
}

double getWidth(num size) {
  return size.w;
}

double getHeight(num size) {
  return size.h;
}

double getPercentWidth(num size) {
  return size.pw;
}

double getPercentHeight(num size) {
  return size.ph;
}

double getPixel(num size) {
  return size.px;
}

double getSizeByScreen(
    {required double mobile,
    required double smallTablet,
    required double rotateTablet,
    double? miniTablet}) {
  double pointValue = deviceWidth;
  if (isRotate) {
    return rotateTablet;
  } else if (pointValue >= BreakPointEnum.ROTATE.size) {
    return smallTablet;
  } else if (pointValue >= BreakPointEnum.MINITABLET.size && miniTablet != null) {
    return miniTablet;
  } else {
    return mobile;
  }
}
