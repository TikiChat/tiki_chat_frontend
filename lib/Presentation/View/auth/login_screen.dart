import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/email_input_screen_widget.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_layout.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Utils/Enum/router_enum.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TkLayout(
      child: Column(
        children: [
          Expanded(
            child: EmailInputScreenWidget(
              title: "로그인 안내 문구",
              textBtnString: "간편 로그인",
              onPressed: () {
                context.push(RouterPathEnum.NO_ACCOUNT.path);
              },
            ),
          ),
          Gap(56.px),
          GestureDetector(
            onTap: () {
              context.push(RouterPathEnum.SIGNUP.path);
            },
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: Center(
                child: TkText(
                  text: "회원가입",
                  style: context.textStyle.h15Bold,
                  color: context.colors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
