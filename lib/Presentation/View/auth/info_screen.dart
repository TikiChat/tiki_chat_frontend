import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/title_layout_widget.dart';
import 'package:tikichat_app/Presentation/View/Auth/email_auth_screen.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_boutton.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_layout.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({
    super.key,
    required this.subTitle,
    required this.title,
  });
  final String title;
  final String subTitle;

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
                onPressed: () {
                  //홈화면으로 이동
                  context.push("${EmailAuthScreen.dynamicName}/test@naver.com");
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
