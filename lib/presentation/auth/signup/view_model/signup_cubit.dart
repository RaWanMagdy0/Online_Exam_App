import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_exam100/presentation/auth/signup/view_model/signup_states.dart';

import 'package:online_exam100/core/api_resault/api_resault.dart';
import '../../../../domain/model/User.dart';
import '../../../../domain/usecase/signup_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  SignupUseCase signupUseCase;
  SignupCubit(this.signupUseCase) : super(SignupInitial());
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var userNameController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObsecure = true;
  bool isCheek = true;
  var emailFromKey = GlobalKey<FormState>();
  var passwordFromKey = GlobalKey<FormState>();



  void signup() async {
    emit(SignupLoadingStata(loadingMessage: "loadin..."''));
    var result =
    await signupUseCase.invoke(
      userNameController.text,
      firstNameController.text,
      lastNameController.text,
      emailController.text,
      passwordController.text,
      confirmPasswordController.text,
      phoneController.text,);
    switch (result) {
      case Success<User?>():
        emit(SignupSuccessStata(user: result.data));
      case Fail<User?>():
        emit(SignupErrorStata(errorMassage: result.serverError?.errorMessage));
    }
  }

  void updateButtonBackGroundColor(bool isCheeked) {
    isCheek = isCheeked;
    emit(UpdateButtonBackGroundColor());
  }
}
