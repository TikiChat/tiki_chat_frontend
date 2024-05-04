import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/agree_line_widget.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/title_layout_widget.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_boutton.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_layout.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Utils/Enum/router_enum.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class AgreeScreen extends StatefulWidget {
  const AgreeScreen({super.key});

  @override
  State<AgreeScreen> createState() => _AgreeScreenState();
}

class _AgreeScreenState extends State<AgreeScreen> {
  @override
  Widget build(BuildContext context) {
    return TkLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleLayoutWidget(
            title: "서비스 이용 약관에\n동의해 주세요",
            children: [
              Gap(32.px),
              Container(
                color: context.colors.lightPink,
                height: 58.px,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 18.5.px),
                child: Row(
                  children: [
                    Container(
                      width: 18.px,
                      height: 18.px,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: context.colors.primary,
                      ),
                      child: Icon(
                        Icons.done,
                        size: 10,
                        color: context.colors.background,
                      ),
                    ),
                    Gap(10.px),
                    TkText(text: "모두 동의합니다.", style: context.textStyle.h15Bold),
                  ],
                ),
              ),
              Gap(21.px),
              const AgreeLineWidget(text: "(필수) 약관 1"),
              const AgreeLineWidget(text: "(필수) 약관 2"),
              const AgreeLineWidget(text: "(필수) 약관 3"),
              const AgreeLineWidget(text: "(필수) 약관 4"),
              const AgreeLineWidget(text: "(필수) 약관 5"),
            ],
          ),
          Column(
            children: [
              TkButton.radius(
                text: "다음",
                padding: EdgeInsets.all(19.px),
                isLong: true,
                onPressed: () {
                  context.push(RouterPathEnum.NICKNAME.path);
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
