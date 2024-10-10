import 'package:flutter/material.dart';
import 'package:online_exam100/core/utils/my_validator.dart';
import 'package:online_exam100/presentation/auth/login/view_model/login_cubit.dart';
import 'package:online_exam100/presentation/auth/widget/custom_text_form_field.dart';

class PasswordFieldWidget extends StatelessWidget {
  final LoginCubit  loginCubit;
  const PasswordFieldWidget({super.key, required this.loginCubit});

  @override
  Widget build(BuildContext context) {
    return    Form(
        key: loginCubit.passwordFormKey,
        child: CustomTextFromField(
          labelText: "Password",
          hintText: "Enter Your Password",
          inputType: TextInputType.text,
          controller: loginCubit.password,
          validator: (value)=>_validatorPassword(value),
          onChanged: (value) {
            if (loginCubit.passwordFormKey.currentState!.validate()) {}
          },
        ));
  }


  String? _validatorPassword(String? value) {
    String? myValidators = MyValidators.passwordValidator(value);
    bool isCheeked = myValidators != null ? false : true;
    loginCubit.updateButtonBackGroundColor(isCheeked);
    return myValidators;
  }
}
