import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam100/core/utils/dialog/DialogMethod.dart';
import 'package:online_exam100/core/utils/my_validator.dart';
import 'package:online_exam100/core/utils/styles.dart';
import 'package:online_exam100/presentation/auth/forget_password/view_model/forget_password_cubit.dart';
import 'package:online_exam100/presentation/auth/login/screen/login_screen.dart';
import 'package:online_exam100/presentation/auth/widget/custom_text_form_field.dart';
import 'package:online_exam100/presentation/auth/widget/submit_button_widget.dart';

class ResetPasswordWidget extends StatelessWidget {
  final ForgetPasswordCubit resetPasswordCubit;
  const ResetPasswordWidget({super.key,required this.resetPasswordCubit});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        _handleStateChange(context, state);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Reset password",
            style: TextStyles.font18BlackWeight600,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(

            "Password must not be empty and must contain \n 6 characters with upper case letter and one  \n                              number at least ",
            style: TextStyles.font14GrayWeight400,
          ),
          SizedBox(
            height: 32.h,
          ),
       _buildPasswordFormWidget(),
          SizedBox(
            height: 32.h,
          ),
         // _buildConfirmPasswordWidget(),
          SizedBox(
            height: 48.h,
          ),
          SubmitButtonWidget(
            text: "Continue ",
            onPressed: () =>resetPasswordCubit.onValidateResetPassword(),
            cheekBackGroundColor: false,
          )
        ],
      ),
    );
  }

  void _handleStateChange(BuildContext context , ForgetPasswordState state){
       if(state is ResetPasswordSuccessStata){
      Navigator.pop(context);
      Navigator.pushNamedAndRemoveUntil(context,
        LoginScreen.routeName, (route) => false,);
    }
    else if(state is ResetPasswordErrorStata)
    {
      Navigator.pop(context);
      DialogMethod.showToast(context: context,
          massage: state.errorMassage!);
    }
    else if(state is ResetPasswordLoadingStata){
      DialogMethod.showLoadingDialog(context: context);
    }
  }
  Widget _buildPasswordFormWidget(){
    return  Form(
      key: resetPasswordCubit.passwordFormKey,
      child: CustomTextFromField(
        controller:resetPasswordCubit.newPasswordController,
        hintText: "New Password",
        labelText: "Enter Your Password ",
        validator: (p0) => MyValidators.passwordValidator(p0),
        onChanged: (p0) =>resetPasswordCubit.onChangedFormField(resetPasswordCubit.passwordFormKey),
      ),
    );
  }
  Widget _buildConfirmPasswordWidget(){
    return  Form(
      key: resetPasswordCubit.confirmPasswordFormKey,
      child: CustomTextFromField(
        controller: resetPasswordCubit.emailController,
        hintText: "Confirm Password",
        labelText: " Confirm Password ",
        validator: (p0) => MyValidators.emailValidator(resetPasswordCubit.emailController.text,),
        onChanged: (p0)=>resetPasswordCubit.onChangedFormField( resetPasswordCubit.emailFormKey),
      ),
    );
  }

}
