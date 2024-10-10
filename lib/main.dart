import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam100/config/theme/app_theme.dart';
import 'package:online_exam100/presentation/auth/forget_password/screen/forget_password_screen.dart';
import 'package:online_exam100/presentation/auth/login/screen/login_screen.dart';
import 'package:online_exam100/presentation/auth/signup/screen/signup_screen.dart';

import 'core/di/di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: LoginScreen.routeName,
          themeMode: ThemeMode.light,
          theme: AppTheme.appTheme,
          routes: {
            SignupScreen.routeName: (context) => SignupScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen()
          },
        );
      },
    );
  }
}
