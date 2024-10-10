import 'package:flutter/cupertino.dart';

import '../../../../domain/model/User.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}
class UpdateButtonBackGroundColor extends SignupState{}
class SignupLoadingStata extends SignupState {
  String ?loadingMessage;
  SignupLoadingStata({
    required this.loadingMessage
});
}
class SignupSuccessStata extends SignupState {
  final User ? user;
  SignupSuccessStata({required this.user});
}
class SignupErrorStata extends SignupState {
  final String  ? errorMassage;
  SignupErrorStata({ this.errorMassage});
}
