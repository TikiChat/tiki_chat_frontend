// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tikichat_app/DI/locator.dart';
import 'package:tikichat_app/Domain/Entitys/terms.dart';
import 'package:tikichat_app/Domain/Entitys/term_agreement.dart';
import 'package:tikichat_app/Domain/Entitys/user_signup_term_agree.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/agree_line_widget.dart';
import 'package:tikichat_app/Presentation/View/Auth/Widgets/title_layout_widget.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_boutton.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_layout.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Presentation/ViewModel/Auth/auth_view_model.dart';
import 'package:tikichat_app/Presentation/ViewModel/Common/cubit_state.dart';
import 'package:tikichat_app/Utils/Enum/router_enum.dart';
import 'package:tikichat_app/Utils/Extension/router_extension.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';
import 'package:tikichat_app/Utils/utils.dart';

class AgreeScreen extends StatefulWidget {
  const AgreeScreen({super.key});

  @override
  State<AgreeScreen> createState() => _AgreeScreenState();
}

class _AgreeScreenState extends State<AgreeScreen> {
  late AuthViewModel authViewModel;
  late Color allAgreeColor;
  late Color allAgreeBgColor;
  List<bool> agreeList = [];

  @override
  void initState() {
    super.initState();
    authViewModel = locator<AuthViewModel>();
    allAgreeBgColor = context.colors.background;
    allAgreeColor = context.colors.darkGrey;
  }

  @override
  Widget build(BuildContext context) {
    return TkLayout(
      child: BlocProvider(
        create: (context) => AuthViewModel()..getAgreeTerms(),
        child: BlocBuilder<AuthViewModel, CubitState<Terms>>(builder: (context, state) {
          if (state is ItemsInitial || state is ItemsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ItemsError<Terms>) {
            return Center(child: Text(state.message));
          } else if (state is ItemsLoaded<Terms>) {
            Terms terms = state.items[0];
            if (agreeList.isEmpty) {
              agreeList = terms.terms.map((e) => false).toList();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleLayoutWidget(
                  title: "서비스 이용 약관에\n동의해 주세요",
                  children: [
                    Gap(32.px),
                    Container(
                      color: context.colors.lightPink,
                      height: 58.px,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 18.5.px),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (agreeList.any((element) => element == false)) {
                                  agreeList = agreeList.map((e) => true).toList();
                                  allAgreeColor = context.colors.background;
                                  allAgreeBgColor = context.colors.primary;
                                } else {
                                  agreeList = agreeList.map((e) => false).toList();
                                  allAgreeColor = context.colors.darkGrey;
                                  allAgreeBgColor = context.colors.background;
                                }
                              });
                            },
                            child: Container(
                              width: 24.px,
                              height: 24.px,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: allAgreeBgColor,
                              ),
                              child: Icon(
                                Icons.done,
                                size: 16.px,
                                color: allAgreeColor,
                              ),
                            ),
                          ),
                          Gap(10.px),
                          TkText(text: "모두 동의합니다.", style: context.textStyle.h15Bold),
                        ],
                      ),
                    ),
                    Gap(21.px),
                    ...List.generate(
                      agreeList.length,
                      (index) => AgreeLineWidget(
                        key: UniqueKey(),
                        term: terms.terms[index],
                        agree: agreeList[index],
                        onTap: () {
                          setState(() {
                            agreeList[index] = !agreeList[index];
                            if (agreeList.every((element) => element == true)) {
                              allAgreeColor = context.colors.background;
                              allAgreeBgColor = context.colors.primary;
                            } else {
                              allAgreeColor = context.colors.darkGrey;
                              allAgreeBgColor = context.colors.background;
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TkButton.radius(
                      text: "다음",
                      padding: EdgeInsets.all(19.px),
                      isLong: true,
                      onPressed: () async {
                        final deviceInfo = await getDeviceInfo();
                        // Todo : device정보 못가져올 상황에 대한 예외처리 필요

                        authViewModel.userData = authViewModel.userData.copyWith(
                            termsAgreementDto: UserSignupTermAgree(agreements: [
                          TermsAgreement(
                            termsId: 1,
                            consentGiven: true,
                            ipAddress: deviceInfo!.$1 as String,
                            deviceInformation: deviceInfo.$2,
                          ),
                          TermsAgreement(
                            termsId: 2,
                            consentGiven: true,
                            ipAddress: deviceInfo.$1 as String,
                            deviceInformation: deviceInfo.$2,
                          ),
                        ]));

                        final isSignUp = await authViewModel.signupNormal(authViewModel.userData);
                        if (isSignUp == true) {
                          //Todo : 홈으로 가도록 변경
                          context.clearAndGo(RouterPathEnum.HOME.path);
                        }
                      },
                    ),
                    Gap(40.px),
                  ],
                ),
              ],
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
