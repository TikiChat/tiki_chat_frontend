import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/title_layout_widget.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_boutton.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_layout.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Utils/Enum/router_enum.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({
    super.key,
    required this.extra,
  });
  final Object extra;

  @override
  Widget build(BuildContext context) {
    Map<String, String> data = extra as Map<String, String>;
    return TkLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleLayoutWidget(
            title: data["email"]!,
            titleColor: context.colors.primary,
            children: [
              Gap(28.px),
              TkText(
                text: data["text"]!,
                style: context.textStyle.h18Bold,
                color: context.colors.black,
              ),
            ],
          ),
          Column(
            children: [
              TkButton.radius(
                text: data["btnText"]!,
                padding: EdgeInsets.all(19.px),
                isLong: true,
                onPressed: () => context.push("${RouterPathEnum.PASSWORD.path}/${data['email']}"),
              ),
              Gap(40.px),
            ],
          ),
        ],
      ),
    );
  }
}
