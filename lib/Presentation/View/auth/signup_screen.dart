import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/email_input_screen_widget.dart';
import 'package:tikichat_app/Presentation/View/Auth/email_auth_screen.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_layout.dart';
import 'package:tikichat_app/Utils/Enum/router_enum.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TkLayout(
      child: Column(
        children: [
          Expanded(
            child: EmailInputScreenWidget(
              title: "가입 안내 문구",
              textBtnString: "간편 가입",
              infoText: "가입 이메일을 입력해주세요",
              onPressed: () {
                context.push("${EmailAuthScreen.dynamicName}/test@naver.com");
              },
              onTap: () {
                // context.push(RouterPathEnum.CONFIRM.path, extra: {
                //   'email': "test@navmer.com",
                //   'text': "위 메일 주소로 가입된 계정이 존재합니다.\n해당 이메일로 로그인 하시겠습니까?",
                //   'btnText': "다음",
                // });
                context.push(RouterPathEnum.AGREE.path);
              },
            ),
          ),
          Gap(55.px),
        ],
      ),
    );
  }
}
