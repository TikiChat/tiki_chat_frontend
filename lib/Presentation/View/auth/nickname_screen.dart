import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tikichat_app/DI/locator.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/title_layout_widget.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_boutton.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_input.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_layout.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Presentation/ViewModel/Auth/auth_view_model.dart';
import 'package:tikichat_app/Utils/Enum/router_enum.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class NickNameScreen extends StatefulWidget {
  const NickNameScreen({super.key});

  @override
  State<NickNameScreen> createState() => _NickNameScreenState();
}

class _NickNameScreenState extends State<NickNameScreen> {
  late Color btnColor;
  late GlobalKey<FormState> formKey;
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    btnColor = context.colors.primary.withOpacity(0.3);
    formKey = GlobalKey<FormState>();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TkLayout(
        child: Form(
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
              TkInput(
                hintText: "레몬사탕",
                isShowCount: true,
                maxLength: 20,
                controller: controller,
              ),
            ],
          ),
          Column(
            children: [
              TkButton.radius(
                text: "다음",
                padding: EdgeInsets.all(19.px),
                bgColor: btnColor,
                isLong: true,
                onPressed: () {
                  AuthViewModel authViewModel = locator<AuthViewModel>();
                  authViewModel.userData =
                      authViewModel.userData.copyWith(nickname: controller.text);

                  if (controller.text != "") {
                    context.push(RouterPathEnum.AGREE.path);
                  }
                },
              ),
              Gap(40.px),
            ],
          ),
        ],
      ),
    ));
  }
}
