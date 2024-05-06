import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class AgreeLineWidget extends StatelessWidget {
  const AgreeLineWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 19.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.done,
                size: 30.px,
                color: context.colors.primary,
              ),
              Gap(13.px),
              TkText(text: text, style: context.textStyle.h13Bold),
            ],
          ),
          Icon(
            Icons.navigate_next,
            size: 30.px,
            color: context.colors.darkGrey,
          ),
        ],
      ),
    );
  }
}
