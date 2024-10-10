import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam100/core/api_resault/api_resault.dart';
import 'package:online_exam100/domain/model/User.dart';
import 'package:online_exam100/domain/usecase/login_use_case.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  void login() async {
    emit(LoginLoadingStata());
    var result =
        await loginUseCase.invoke(email: email.text, password: password.text);
    switch (result) {
      case Success<User?>():
        emit(LoginSuccessStata(user: result.data));
      case Fail<User?>():
        emit(LoginErrorStata(errorMassage: result.serverError?.errorMessage));
    }
  }

  bool isCheek = true;
  void updateButtonBackGroundColor(bool isCheeked) {
    isCheek = isCheeked;
    emit(UpdateButtonBackGroundColor());
  }
}
