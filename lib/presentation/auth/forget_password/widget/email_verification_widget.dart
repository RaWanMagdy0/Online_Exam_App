import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam100/core/utils/dialog/DialogMethod.dart';
import 'package:online_exam100/core/utils/styles.dart';
import 'package:online_exam100/presentation/auth/forget_password/view_model/forget_password_cubit.dart';
import '../../widget/prom_pto_widet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerificationWidget extends StatelessWidget {
  final ForgetPasswordCubit forgetPasswordCubit;

  const EmailVerificationWidget({super.key, required this.forgetPasswordCubit});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        _handleStataChange(state, context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Email verification",
            style: TextStyles.font18BlackWeight600,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            "Please enter your code that send to your\n            email address",
            style: TextStyles.font14GrayWeight400,
          ),
          SizedBox(
            height: 32.h,
          ),
          _buildPinCodeField(context),
          SizedBox(
            height: 48.h,
          ),
          _buildResetCodePromPtoWidget(),
        ],
      ),
    );
  }

  void _handleStataChange(ForgetPasswordState state, BuildContext context) {
    if (state is EmailVerifyCodeSuccessStata) {
      Navigator.pop(context);
      forgetPasswordCubit.pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceInOut);
    } else if (state is EmailVerifyCodeErrorStata) {
      Navigator.pop(context);
      DialogMethod.showToast(context: context, massage: state.errorMassage!);
    } else if (state is EmailVerifyCodeLoadingStata) {
      DialogMethod.showLoadingDialog(context: context);
    }
  }

  Widget _buildPinCodeField(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        disabledColor: Colors.grey,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        selectedColor: Colors.red,
        fieldHeight: 74.h,
        fieldWidth: 50.w,
        errorBorderColor: Colors.white,
        inactiveFillColor: Colors.white,
        activeColor: Colors.red,
        inactiveColor: Colors.red,
        selectedFillColor: Colors.white,
        activeFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (value) => forgetPasswordCubit.onCompletePinCode(value),
      keyboardType: TextInputType.phone,
      enabled: true,
      appContext: context,
    );
  }

  Widget _buildResetCodePromPtoWidget() {
    return PromPtoWidget(
      text: "Didn't receive code? ",
      textButton: "Reset",
      onPressed: () {
        forgetPasswordCubit.forgetPassword();
      },
    );
  }
}
