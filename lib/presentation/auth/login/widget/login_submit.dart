import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam100/presentation/auth/login/view_model/login_cubit.dart';
import 'package:online_exam100/presentation/auth/widget/submit_button_widget.dart';

class LoginSubmit extends StatelessWidget {
  final LoginCubit loginCubit;
  const LoginSubmit({super.key, required this.loginCubit});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LoginCubit , LoginState>(
      builder: (context, state) {
        return SubmitButtonWidget(
          text: "Login ",
          cheekBackGroundColor:!loginCubit.isCheek,
          onPressed: _onPressed
        );
      },
    );
  }

    bool _cheekEmailOrPasswordIsValidate(){
      bool isCheekFromKey = loginCubit.emailFormKey.currentState!.validate()
          || loginCubit.passwordFormKey.currentState!.validate();
      return isCheekFromKey;
    }
     _onPressed(){
       if( _cheekEmailOrPasswordIsValidate()){
         loginCubit.login();

       }
     }

}
