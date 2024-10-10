import 'package:flutter/material.dart';
import 'package:online_exam100/core/utils/styles.dart';
import 'package:online_exam100/presentation/auth/forget_password/screen/forget_password_screen.dart';
import 'package:online_exam100/presentation/auth/forget_password/widget/forget_password_widget.dart';

class ForgetPasswordButtonWidget extends StatelessWidget {
  const ForgetPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(
          context,
           ForgetPasswordScreen.routeName,
          );
        },
        child: Text("ForgetPassword",
            textAlign: TextAlign.left, style: TextStyles.font13BlackWeight400));
  }
}
