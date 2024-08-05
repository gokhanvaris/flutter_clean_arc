import 'package:flutter/material.dart';
import 'package:flutter_clean_arc/feature/auth/login/login_view.dart';
import 'package:flutter_clean_arc/feature/auth/register/register_view.dart';
import 'package:flutter_clean_arc/product/utility/enums/app_enums.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter routers = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: RouterEnums.initial.value,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: RouterEnums.register.value,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterView();
        },
      ),
      GoRoute(
        path: RouterEnums.login.value,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        },
      ),
    ],
  );
}
