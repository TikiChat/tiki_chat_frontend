import 'package:flutter/material.dart';
import 'package:tikichat_app/Utils/Enum/common_enum.dart';
import 'package:tikichat_app/Utils/Extension/input_format_extension.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class TkInput extends StatefulWidget {
  const TkInput({
    super.key,
    this.validator,
    this.hintText,
    this.isShowCount,
    this.maxLength,
    this.suffixIcon,
    this.ishide,
    this.compare,
    required this.controller,
  });
  final InputValidateEnum? validator;
  final String? hintText;
  final bool? isShowCount;
  final int? maxLength;
  final Widget? suffixIcon;
  final bool? ishide;
  final TextEditingController? compare;
  final TextEditingController controller;

  @override
  State<TkInput> createState() => _TkInputState();
}

class _TkInputState extends State<TkInput> {
  var textLength = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: context.textStyle.h15Medium,
      obscureText: widget.ishide ?? false,
      obscuringCharacter: '⦁',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        switch (widget.validator) {
          case InputValidateEnum.EMAIL:
            return value!.isEmail();
          case InputValidateEnum.PWD:
            return value!.isPasswoard();
          case InputValidateEnum.PWD_CONFIRM:
            return value!.isPasswoardConfirm(compare: widget.compare?.text ?? "");
          default:
            return null;
        }
      },
      maxLength: widget.maxLength,
      onChanged: (value) {
        setState(() {
          textLength = value.length;
        });
      },
      decoration: InputDecoration(
        errorStyle: context.textStyle.h15Medium.copyWith(color: context.colors.error),
        contentPadding: EdgeInsets.all(18.px),
        hintStyle: context.textStyle.h15Medium.copyWith(color: context.colors.hintText),
        filled: true,
        fillColor: context.colors.inputBackGround,
        border: InputBorder.none,
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: context.colors.inputBorder,
          ),
        ),
        suffixIconConstraints: BoxConstraints.expand(width: 45.px, height: 20.px),
        suffixIcon: widget.suffixIcon,
        counterText: "",
        suffixText: widget.isShowCount == true
            ? '${textLength.toString()}/${widget.maxLength.toString()}'
            : "",
      ),
    );
  }
}
