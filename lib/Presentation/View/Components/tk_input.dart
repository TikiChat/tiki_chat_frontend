import 'package:flutter/material.dart';
import 'package:tikichat_app/Utils/Enum/common_enum.dart';
import 'package:tikichat_app/Utils/Extension/input_format_extension.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class TkInput extends StatelessWidget {
  const TkInput({super.key, required this.validator});
  final InputValidateEnum validator;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return TextFormField(
      controller: controller,
      style: context.textStyle.h2Medium,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        switch (validator) {
          case InputValidateEnum.EMAIL:
            return value!.isEmail();
          default:
            return null;
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(18.px),
        hintStyle: context.textStyle.h2Medium.copyWith(color: context.colors.hintText),
        filled: true,
        fillColor: context.colors.inputBackGround,
        border: InputBorder.none,
        hintText: '이메일을 입력해 주세요',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: context.colors.inputBorder,
          ),
        ),
      ),
    );
  }
}
