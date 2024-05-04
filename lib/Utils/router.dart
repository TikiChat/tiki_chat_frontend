import 'package:go_router/go_router.dart';
import 'package:tikichat_app/Presentation/View/Auth/agree_screen.dart';
import 'package:tikichat_app/Presentation/View/Auth/confirm_screen.dart';
import 'package:tikichat_app/Presentation/View/Auth/email_auth_screen.dart';
import 'package:tikichat_app/Presentation/View/Auth/login_screen.dart';
import 'package:tikichat_app/Presentation/View/Auth/nickname_screen.dart';
import 'package:tikichat_app/Presentation/View/Auth/info_screen.dart';
import 'package:tikichat_app/Presentation/View/Auth/password_config_screen.dart';
import 'package:tikichat_app/Presentation/View/Auth/signup_screen.dart';
import 'package:tikichat_app/Utils/Enum/router_enum.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: RouterPathEnum.SIGNIN.path,
  routes: [
    GoRoute(
      path: RouterPathEnum.SIGNIN.path,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RouterPathEnum.SIGNUP.path,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: RouterPathEnum.AGREE.path,
      builder: (context, state) => const AgreeScreen(),
    ),
    GoRoute(
        path: RouterPathEnum.CONFIRM.path,
        builder: (context, state) {
          return ConfirmScreen(
            extra: state.extra!,
          );
        }),
    GoRoute(
      path: RouterPathEnum.NICKNAME.path,
      builder: (context, state) => const NickNameScreen(),
    ),
    GoRoute(
      path: RouterPathEnum.PWD_CONFIG.path,
      builder: (context, state) => const PasswordConfigScreen(),
    ),
    GoRoute(
      path: RouterPathEnum.NO_ACCOUNT.path,
      builder: (context, state) => const InfoScreen(
        title: "회원가입을\n먼저 진행해 주세요.",
        subTitle: "존재하지 않는 이메일입니다.",
      ),
    ),
    GoRoute(
      path: RouterPathEnum.NO_PASSWORD.path,
      builder: (context, state) => const InfoScreen(
        title: "비밀번호 설정이\n필요한 계정입니다.",
        subTitle: "이메일 인증을 먼저 진행해 주세요",
      ),
    ),
    GoRoute(
      path: RouterPathEnum.EMAIL_AUTH.path,
      builder: (context, state) {
        return EmailAuthScreen(
          email: state.pathParameters['email']!,
        );
      },
    ),
  ],
);
