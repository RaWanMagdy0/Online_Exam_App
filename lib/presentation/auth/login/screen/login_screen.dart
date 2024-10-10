import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam100/core/di/di.dart';
import 'package:online_exam100/core/utils/dialog/DialogMethod.dart';
import 'package:online_exam100/presentation/auth/login/view_model/login_cubit.dart';
import 'package:online_exam100/presentation/auth/login/widget/email_field_widget.dart';
import 'package:online_exam100/presentation/auth/login/widget/forget_password_button_widget.dart';
import 'package:online_exam100/presentation/auth/login/widget/login_submit.dart';
import 'package:online_exam100/presentation/auth/login/widget/password_field_widget.dart';
import 'package:online_exam100/presentation/auth/login/widget/remember_me_widget.dart';
import 'package:online_exam100/presentation/auth/signup/screen/signup_screen.dart';
import 'package:online_exam100/presentation/auth/widget/prom_pto_widet.dart';

class LoginScreen extends StatefulWidget {
  static String routeName="Login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var loginViewModel = getIt.get<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginViewModel,
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) => _handleBlocListener(state),
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Login",
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                child: Center(
                  child: Column(
                    children: [
                      EmailFieldWidget(
                        loginCubit: loginViewModel,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      PasswordFieldWidget(
                        loginCubit: loginViewModel,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      const Row(
                        children: [
                          RememberMeWidget(),
                          Spacer(),
                          ForgetPasswordButtonWidget()
                ],
                      ),
                      SizedBox(
                        height: 64.h,
                      ),
                      LoginSubmit(
                        loginCubit: loginViewModel,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      PromPtoWidget(
                        text: "Don't have an account",
                        textButton: " Sign up",
                        onPressed: () {
                          Navigator.pushNamed(context, SignupScreen.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }

  dynamic _handleBlocListener(LoginState loginStata) {
    {
      switch (loginStata) {
        case LoginLoadingStata():
          DialogMethod.showLoadingDialog(context: context);
        case LoginSuccessStata():
          Navigator.pop(context);
          case LoginErrorStata():
          Navigator.pop(context);
          DialogMethod.showToast(context: context,
              massage: loginStata.errorMassage!);
        default:
          return;
      }
    }
  }
}
