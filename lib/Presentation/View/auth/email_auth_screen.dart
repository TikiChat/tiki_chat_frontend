import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/otp_button_widget.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/title_layout_widget.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_boutton.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_layout.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Utils/Enum/router_enum.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class EmailAuthScreen extends StatelessWidget {
  const EmailAuthScreen({super.key, required this.email});
  final String email;

  static String dynamicName = "/emailAuth";

  @override
  Widget build(BuildContext context) {
    final controllerList = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];
    return TkLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleLayoutWidget(
            title: "이메일을 인증해 주세요.",
            children: [
              Gap(20.px),
              TkText(
                text: email,
                style: context.textStyle.h20Bold,
                color: context.colors.primary,
              ),
              Gap(20.px),
              TkText(text: "위 주소로 OTP번호가 전송되었습니다.", style: context.textStyle.h12Medium),
              Gap(53.px),
              Row(
                children: [
                  OtpButtonWidget(controller: controllerList[0]),
                  Gap(17.px),
                  OtpButtonWidget(controller: controllerList[1]),
                  Gap(17.px),
                  OtpButtonWidget(controller: controllerList[2]),
                  Gap(17.px),
                  OtpButtonWidget(controller: controllerList[3]),
                ],
              ),
            ],
          ),
          Column(
            children: [
              TkButton.radius(
                text: "다음",
                padding: EdgeInsets.all(19.px),
                isLong: true,
                onPressed: () {
                  //홈화면으로 이동
                  context.push(RouterPathEnum.PWD_CONFIG.path);
                },
              ),
              Gap(40.px),
            ],
          ),
        ],
      ),
    );
  }
}
