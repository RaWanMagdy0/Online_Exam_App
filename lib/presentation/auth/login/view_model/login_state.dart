part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
class UpdateButtonBackGroundColor extends LoginState{}
class LoginLoadingStata extends LoginState {}
class LoginSuccessStata extends LoginState {
  final User ? user;
  LoginSuccessStata({required this.user});
}
class LoginErrorStata extends LoginState {
  final String ? errorMassage;
  LoginErrorStata({ this.errorMassage});
}
