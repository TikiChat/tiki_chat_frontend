import 'package:go_router/go_router.dart';
import 'package:tikichat_app/Presentation/View/auth/login_screen.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
