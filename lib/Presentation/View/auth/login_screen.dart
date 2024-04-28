import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_boutton.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_layout.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_input.dart';
import 'package:tikichat_app/Utils/Enum/common_enum.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TkLayout(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(81.h),
            TkText(
              text: "로그인 안내 문구",
              style: context.textStyle.h1Bold,
            ),
            Gap(71.h),
            const TkInput(validator: InputValidateEnum.EMAIL),
            Expanded(child: Gap(224.h)),
            TkButton.radius(
              text: "다음",
              padding: EdgeInsets.all(19.px),
              isLong: true,
            ),
            Gap(35.h),
            Stack(
              children: [
                Divider(color: context.colors.inputBorder),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 21.px),
                    color: context.colors.background,
                    child: TkText(
                      text: "간편 로그인",
                      style: context.textStyle.h2Bold,
                      color: context.colors.textColor,
                    ),
                  ),
                ),
              ],
            ),
            Gap(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TkButton.outline(
                    bgColor: context.colors.background,
                    text: SocialEnum.KAKAO.text,
                    padding: EdgeInsets.all(22.px),
                    textColor: context.colors.black,
                  ),
                ),
                Gap(7.h),
                Expanded(
                  child: TkButton.outline(
                    bgColor: context.colors.background,
                    text: SocialEnum.NAVER.text,
                    padding: EdgeInsets.all(22.px),
                    textColor: context.colors.black,
                  ),
                ),
                Gap(7.h),
                Expanded(
                  child: TkButton.outline(
                    bgColor: context.colors.background,
                    text: SocialEnum.GOOGLE.text,
                    padding: EdgeInsets.all(22.px),
                    textColor: context.colors.black,
                  ),
                ),
              ],
            ),
            Gap(64.h),
            Center(
              child: TkText(
                text: "회원가입",
                style: context.textStyle.h2Bold,
                color: context.colors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
