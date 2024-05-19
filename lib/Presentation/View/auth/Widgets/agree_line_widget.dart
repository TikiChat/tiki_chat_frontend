import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tikichat_app/DI/locator.dart';
import 'package:tikichat_app/Domain/Entitys/term.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Presentation/ViewModel/Auth/auth_view_model.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class AgreeLineWidget extends StatefulWidget {
  const AgreeLineWidget({super.key, required this.term, required this.agree, required this.onTap});
  final Term term;
  final bool agree;
  final void Function() onTap;

  @override
  State<AgreeLineWidget> createState() => _AgreeLineWidgetState();
}

class _AgreeLineWidgetState extends State<AgreeLineWidget> {
  late Color iconColor;
  late AuthViewModel authViewModel;

  @override
  void initState() {
    super.initState();

    iconColor = widget.agree ? context.colors.primary : context.colors.darkGrey;
    authViewModel = locator<AuthViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 19.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (widget.agree == false) {
                  iconColor = context.colors.darkGrey;
                } else {
                  iconColor = context.colors.primary;
                }
              });
              widget.onTap();
            },
            child: Row(
              children: [
                Icon(
                  Icons.done,
                  size: 30.px,
                  color: iconColor,
                ),
                Gap(13.px),
                TkText(text: widget.term.content, style: context.textStyle.h13Bold),
              ],
            ),
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
