import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_exam100/presentation/auth/signup/view_model/signup_states.dart';

import '../../../../domain/common/api_result.dart';
import '../../../../domain/common/custom_exception.dart';
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
        phoneController.text, );
    switch (result) {
      case Success<User?>():
        emit(SignupSuccessStata(user: result.data));
      case Fail<User?>():
        switch(result){
          case  DioHttpException():
            emit(SignupErrorStata(errorMassage:'Invalild Email  Or Password'));
          case NoInternetError():
            emit(SignupErrorStata(errorMassage:"NO Internt Execption "));
          default:
            emit(SignupErrorStata(errorMassage: result.exception.toString()));
        }

    }
  }

  void updateButtonBackGroundColor(bool isCheeked) {
    isCheek = isCheeked;
    emit(UpdateButtonBackGroundColor());
  }
}
