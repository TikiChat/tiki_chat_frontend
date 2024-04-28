import 'package:flutter/material.dart';
import 'package:tikichat_app/Utils/Enum/common_enum.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';

class CuTextStyles {
  /// @description
  /// - fontSize: 30.sp
  /// - fontWeight: semiBold(700)
  ///
  TextStyle h1Bold = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeightEnum.BOLD.fontWeight,
  );

  /// @description
  /// - fontSize: 30.sp
  /// - fontWeight: semiBold(600)
  ///
  TextStyle h1 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeightEnum.SEMI_BOLD.fontWeight,
  );

  /// @description
  /// - fontSize: 30.sp
  /// - fontWeight: semiBold(600)
  ///
  TextStyle h1Regular = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeightEnum.REGULAR.fontWeight,
  );

  /// @description
  /// - fontSize: 15.sp
  /// - fontWeight: bold(600)
  ///
  TextStyle h2Bold = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightEnum.BOLD.fontWeight,
  );

  /// @description
  /// - fontSize: 15.sp
  /// - fontWeight: semiBold(600)
  ///
  TextStyle h2 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightEnum.SEMI_BOLD.fontWeight,
  );

  /// @description
  /// - fontSize: 15.sp
  /// - fontWeight: medium(500)
  ///
  TextStyle h2Medium = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightEnum.MEDIUM.fontWeight,
  );
}
