import 'package:flutter/material.dart';
import 'package:online_exam/config/routes/page_route_name.dart';
import 'package:online_exam/feature/auth/presentation/forget_password/view/forget_password_view.dart';
import 'package:online_exam/feature/auth/presentation/register/view/register_view.dart';
import 'package:online_exam/feature/home_layout/view/home_layout_view.dart';
import 'package:online_exam/feature/splash/splash_view.dart';

import '../../feature/auth/presentation/login/view/login_view.dart';
class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.splash:
        return _handleMaterialPageRoute(widget: const SplashView());
      case PageRouteName.login:
        return _handleMaterialPageRoute(widget: const LoginView());
      case PageRouteName.register:
        return _handleMaterialPageRoute(widget: const RegisterView());
      case PageRouteName.forgetPassword:
        return _handleMaterialPageRoute(widget: const ForgetPasswordView());
      case PageRouteName.mainHome:
        return _handleMaterialPageRoute(widget: const HomeLayoutView());

      default:
        return _handleMaterialPageRoute(widget: const Scaffold());
    }
  }

  static MaterialPageRoute<dynamic> _handleMaterialPageRoute(
      {required Widget widget}) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}