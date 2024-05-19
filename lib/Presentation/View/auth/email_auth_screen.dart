// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tikichat_app/DI/locator.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/otp_button_widget.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/title_layout_widget.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_boutton.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_layout.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Presentation/ViewModel/Auth/auth_view_model.dart';
import 'package:tikichat_app/Utils/Enum/router_enum.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class EmailAuthScreen extends StatelessWidget {
  const EmailAuthScreen({super.key, required this.email, required this.isOnlyPwd});
  final String email;
  final String isOnlyPwd;

  static String dynamicName = "/emailAuth";

  @override
  Widget build(BuildContext context) {
    final controllerList = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];
    final focusList = [
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
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
                  OtpButtonWidget(
                    controller: controllerList[0],
                    nextFocus: focusList[0],
                    focus: null,
                  ),
                  Gap(8.px),
                  OtpButtonWidget(
                    controller: controllerList[1],
                    nextFocus: focusList[1],
                    focus: focusList[0],
                  ),
                  Gap(8.px),
                  OtpButtonWidget(
                    controller: controllerList[2],
                    nextFocus: focusList[2],
                    focus: focusList[1],
                  ),
                  Gap(8.px),
                  OtpButtonWidget(
                    controller: controllerList[3],
                    nextFocus: focusList[3],
                    focus: focusList[2],
                  ),
                  Gap(8.px),
                  OtpButtonWidget(
                    controller: controllerList[4],
                    nextFocus: focusList[4],
                    focus: focusList[3],
                  ),
                  Gap(8.px),
                  OtpButtonWidget(
                    controller: controllerList[5],
                    focus: focusList[4],
                  ),
                ],
              ),
              Gap(27.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TkText(
                    text: "이메일이 전송되지 않았나요?",
                    style: context.textStyle.h15Medium,
                    color: context.colors.lightGrey10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      AuthViewModel authViewModel = locator<AuthViewModel>();
                      await authViewModel.sendAuthCode(email);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.px),
                      child: TkText(
                        text: "이메일 재전송",
                        style: context.textStyle.h15Bold,
                        color: context.colors.primary,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Column(
            children: [
              TkButton.radius(
                text: "다음",
                padding: EdgeInsets.all(19.px),
                isLong: true,
                onPressed: () async {
                  AuthViewModel authViewModel = locator<AuthViewModel>();
                  String certNumber = controllerList.map((ctrl) => ctrl.text).toList().join();
                  final isVerify = await authViewModel.getAuthVerify(email, certNumber);

                  if (isVerify) {
                    authViewModel.userData = authViewModel.userData.copyWith(email: email);
                    context.push("${RouterPathEnum.PWD_CONFIG.path}/$isOnlyPwd");
                  }
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
