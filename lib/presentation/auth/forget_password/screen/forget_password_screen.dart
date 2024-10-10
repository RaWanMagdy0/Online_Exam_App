import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam100/core/di/di.dart';
import 'package:online_exam100/presentation/auth/forget_password/view_model/forget_password_cubit.dart';
import 'package:online_exam100/presentation/auth/forget_password/widget/email_verification_widget.dart';
import 'package:online_exam100/presentation/auth/forget_password/widget/forget_password_widget.dart';
import 'package:online_exam100/presentation/auth/forget_password/widget/reset_password_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static String routeName = "ForgetPasswordScreen";
  ForgetPasswordScreen({super.key});

  var forgetPasswordPasswordViewModel = getIt.get<ForgetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => forgetPasswordPasswordViewModel,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Password",
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: forgetPasswordPasswordViewModel.pageController,
              reverse: true,
              scrollDirection: Axis.horizontal,
              padEnds: true,
              children: [
                ForgetPasswordWidget(
                  forgetPasswordCubit: forgetPasswordPasswordViewModel,
                ),
                EmailVerificationWidget(
                    forgetPasswordCubit: forgetPasswordPasswordViewModel),
                 ResetPasswordWidget(
                  resetPasswordCubit: forgetPasswordPasswordViewModel,
                ),
              ],
            ),
          )),
    );
  }
}
