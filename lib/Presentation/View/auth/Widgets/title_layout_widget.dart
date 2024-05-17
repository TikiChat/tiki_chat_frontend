import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class TitleLayoutWidget extends StatelessWidget {
  const TitleLayoutWidget({
    super.key,
    required this.title,
    required this.children,
    this.titleColor,
  });
  final String title;
  final List<Widget> children;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Gap(28.px),
        TkText(
          text: title,
          style: context.textStyle.h30Bold,
          color: titleColor ?? context.colors.black,
        ),
        ...children,
      ]),
    );
  }
}
