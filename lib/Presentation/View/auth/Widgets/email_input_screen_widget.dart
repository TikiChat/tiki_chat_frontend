import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tikichat_app/DI/locator.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/title_layout_widget.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_boutton.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_input.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Presentation/ViewModel/Auth/auth_view_model.dart';
import 'package:tikichat_app/Utils/Enum/common_enum.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class EmailInputScreenWidget extends StatefulWidget {
  const EmailInputScreenWidget({
    super.key,
    required this.title,
    required this.textBtnString,
    this.infoText,
    this.onTap,
    required this.onPressed,
  });
  final String title;
  final String textBtnString;
  final String? infoText;
  final void Function()? onTap;
  final void Function(String value) onPressed;

  @override
  State<EmailInputScreenWidget> createState() => _EmailInputScreenWidgetState();
}

class _EmailInputScreenWidgetState extends State<EmailInputScreenWidget> {
  late TextEditingController controller;
  late GlobalKey<FormState> formKey;
  late AuthViewModel authViewModel;
  late Color btnColor;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
    formKey = GlobalKey<FormState>();
    btnColor = context.colors.primary.withOpacity(0.3);
    authViewModel = locator<AuthViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      onChanged: () {
        if (formKey.currentState!.validate() == true) {
          setState(() {
            btnColor = context.colors.primary;
          });
        } else {
          setState(() {
            btnColor = context.colors.primary.withOpacity(0.3);
          });
        }
      },
      child: TitleLayoutWidget(
        title: widget.title,
        children: [
          Gap(55.px),
          TkText(
            text: widget.infoText ?? "",
            style: context.textStyle.h15Bold,
          ),
          Gap(8.px),
          TkInput(validator: InputValidateEnum.EMAIL, controller: controller),
          Expanded(child: Gap(224.px)),
          TkButton.radius(
            text: "다음",
            padding: EdgeInsets.all(19.px),
            isLong: true,
            bgColor: btnColor,
            onPressed: btnColor == context.colors.primary
                ? () async => widget.onPressed(controller.text)
                : null,
          ),
          Gap(27.px),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.px),
                child: Divider(color: context.colors.inputBorder),
              ),
              Center(
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 21.px, vertical: 8.px),
                    color: context.colors.background,
                    child: TkText(
                      text: widget.textBtnString,
                      style: context.textStyle.h15Bold,
                      color: context.colors.textColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(12.px),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TkButton.outline(
                  bgColor: context.colors.background,
                  text: SocialEnum.KAKAO.text,
                  padding: EdgeInsets.all(22.px),
                  textColor: context.colors.black,
                  onPressed: authViewModel.loginKakao,
                ),
              ),
              Gap(7.h),
              Expanded(
                child: TkButton.outline(
                  bgColor: context.colors.background,
                  text: SocialEnum.NAVER.text,
                  padding: EdgeInsets.all(22.px),
                  textColor: context.colors.black,
                  onPressed: authViewModel.loginNaver,
                ),
              ),
              Gap(7.h),
              Expanded(
                child: TkButton.outline(
                  bgColor: context.colors.background,
                  text: SocialEnum.GOOGLE.text,
                  padding: EdgeInsets.all(22.px),
                  textColor: context.colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
