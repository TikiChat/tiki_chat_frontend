import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/title_layout_widget.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_boutton.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_input.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_layout.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class NickNameScreen extends StatelessWidget {
  const NickNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TkLayout(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleLayoutWidget(
          title: "닉네임 입력",
          children: [
            Gap(55.px),
            TkText(
              text: "닉네임을 입력해 주세요",
              style: context.textStyle.h15Bold,
            ),
            Gap(8.px),
            const TkInput(
              hintText: "레몬사탕",
              isShowCount: true,
              maxLength: 20,
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
                // context.clearAndGo(RouterPathEnum.SIGNIN.path);
              },
            ),
            Gap(40.px),
          ],
        ),
      ],
    ));
  }
}
