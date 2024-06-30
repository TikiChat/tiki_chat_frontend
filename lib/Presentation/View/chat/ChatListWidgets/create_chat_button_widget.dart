import 'package:flutter/material.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class create_chat_button_widget extends StatelessWidget {
  const create_chat_button_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 15.px, top: 12.px, right: 17.px, bottom: 15.px),
      decoration: BoxDecoration(
          color: context.colors.primary,
          borderRadius: BorderRadius.circular(27.px)),
      child: Center(
        child: TkText(
          text: "+채팅 만들기",
          style: context.textStyle.h15,
          color: context.colors.white,
        ),
      ),
    );
  }
}
