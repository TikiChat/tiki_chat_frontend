// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tikichat_app/DI/locator.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/title_layout_widget.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_boutton.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_layout.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Presentation/ViewModel/Auth/auth_view_model.dart';
import 'package:tikichat_app/Utils/Enum/router_enum.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({
    super.key,
    required this.subTitle,
    required this.title,
    required this.email,
  });
  final String title;
  final String subTitle;
  final String email;

  @override
  Widget build(BuildContext context) {
    return TkLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleLayoutWidget(
            title: title,
            children: [
              Gap(11.px),
              TkText(text: subTitle, style: context.textStyle.h15Medium),
            ],
          ),
          Column(
            children: [
              TkButton.radius(
                text: "다음",
                padding: EdgeInsets.all(19.px),
                isLong: true,
                onPressed: () async {
                  //홈화면으로 이동
                  AuthViewModel authViewModel = locator<AuthViewModel>();
                  await authViewModel.sendAuthCode(email);
                  context.push("${RouterPathEnum.EMAIL_AUTH.path}/$email/false");
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
