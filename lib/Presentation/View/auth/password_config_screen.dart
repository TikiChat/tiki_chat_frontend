import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/title_layout_widget.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_boutton.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_input.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_layout.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Utils/Enum/common_enum.dart';
import 'package:tikichat_app/Utils/Enum/router_enum.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';
import 'package:tikichat_app/Utils/constants.dart';

class PasswordConfigScreen extends StatefulWidget {
  const PasswordConfigScreen({super.key});

  @override
  State<PasswordConfigScreen> createState() => _PasswordConfigScreenState();
}

class _PasswordConfigScreenState extends State<PasswordConfigScreen> {
  late TextEditingController pwdCtrl;
  late TextEditingController pwdConfirmCtrl;
  late GlobalKey<FormState> formKey;
  late Color btnColor;

  @override
  void initState() {
    super.initState();
    pwdCtrl = TextEditingController();
    pwdConfirmCtrl = TextEditingController();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleLayoutWidget(
              title: "비밀번호를 설정해 주세요.",
              children: [
                Gap(28.px),
                TkText(
                  text: "비밀번호를 설정해주세요.",
                  style: context.textStyle.h15Bold,
                  color: context.colors.lightDarkFont,
                ),
                Gap(12.h),
                TkText(
                  text:
                      "✓ 영문·특수문자·숫자를 모두 조합해 주세요.\n✓ 8자리 이상 20자리 이하로 구성해 주세요.\n✓ 특수문자는 !@#\$%^&* 만 사용 가능합니다.",
                  maxLine: 3,
                  style: context.textStyle.h11Medium,
                  color: context.colors.primary,
                ),
                Gap(50.px),
                TkInput(
                  controller: pwdCtrl,
                  validator: InputValidateEnum.PWD,
                  ishide: true,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 22.px),
                    child: SvgPicture.asset(pwdIcon),
                  ),
                ),
                Gap(41.px),
                TkInput(
                  controller: pwdConfirmCtrl,
                  compare: pwdCtrl,
                  validator: InputValidateEnum.PWD_CONFIRM,
                  ishide: true,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 22.px),
                    child: SvgPicture.asset(pwdIcon),
                  ),
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
                  onPressed: formKey.currentState?.validate() != true
                      ? null
                      : () => context.push(RouterPathEnum.NICKNAME.path),
                ),
                Gap(40.px),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
