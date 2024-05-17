import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/title_layout_widget.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_boutton.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_input.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Utils/Enum/common_enum.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class EmailInputScreenWidget extends StatelessWidget {
  const EmailInputScreenWidget({
    super.key,
    required this.title,
    required this.textBtnString,
    this.infoText,
    this.onTap,
    this.onPressed,
  });
  final String title;
  final String textBtnString;
  final String? infoText;
  final void Function()? onTap;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TitleLayoutWidget(
      title: title,
      children: [
        Gap(55.px),
        TkText(
          text: infoText ?? "",
          style: context.textStyle.h15Bold,
        ),
        Gap(8.px),
        const TkInput(validator: InputValidateEnum.EMAIL),
        Expanded(child: Gap(224.px)),
        TkButton.radius(
          text: "다음",
          padding: EdgeInsets.all(19.px),
          isLong: true,
          onPressed: onPressed,
        ),
        Gap(27.px),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.px),
              child: Divider(color: context.colors.inputBorder),
            ),
            Center(
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 21.px, vertical: 8.px),
                  color: context.colors.background,
                  child: TkText(
                    text: textBtnString,
                    style: context.textStyle.h15Bold,
                    color: context.colors.textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        Gap(12.px),
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
      ],
    );
  }
}
