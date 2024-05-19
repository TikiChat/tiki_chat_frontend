// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:size_setter/size_setter.dart';
import 'package:tikichat_app/DI/locator.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/title_layout_widget.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_boutton.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_input.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_layout.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Presentation/ViewModel/Auth/auth_view_model.dart';
import 'package:tikichat_app/Utils/Enum/common_enum.dart';
import 'package:tikichat_app/Utils/Enum/router_enum.dart';
import 'package:tikichat_app/Utils/Extension/router_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';
import 'package:tikichat_app/Utils/constants.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key, required this.email});

  final String email;

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  late TextEditingController controller;
  late GlobalKey<FormState> formKey;
  late Color btnColor;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
    formKey = GlobalKey<FormState>();
    btnColor = context.colors.primary.withOpacity(0.3);
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
        child: TitleLayoutWidget(
          title: "로그인 안내 문구 :PW",
          children: [
            Gap(55.px),
            Gap(8.px),
            TkInput(
              validator: InputValidateEnum.PWD,
              controller: controller,
              hintText: "비밀번호를 입력해 주세요",
              ishide: true,
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 22.px),
                child: SvgPicture.asset(pwdIcon),
              ),
            ),
            Gap(15.px),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    AuthViewModel authViewModel = locator<AuthViewModel>();
                    await authViewModel.sendAuthCode(widget.email);
                    context.push("${RouterPathEnum.EMAIL_AUTH.path}/${widget.email}/true");
                  },
                  child: TkText(
                    text: "비밀번호 찾기",
                    style: context.textStyle.h12Bold,
                    color: context.colors.lightGrey90,
                  ),
                ),
              ],
            ),
            Expanded(child: Gap(209.px)),
            TkButton.radius(
              text: "로그인",
              padding: EdgeInsets.all(19.px),
              isLong: true,
              bgColor: btnColor,
              onPressed: () async {
                AuthViewModel authViewModel = locator<AuthViewModel>();
                final result = await authViewModel
                    .signinNormal({"email": widget.email, "password": controller.text});

                if (result == true) {
                  //홈으로 가도록 변경
                  context.clearAndGo(RouterPathEnum.HOME.path);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
