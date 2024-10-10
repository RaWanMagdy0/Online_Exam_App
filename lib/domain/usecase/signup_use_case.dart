import 'package:online_exam100/core/api_resault/api_resault.dart';
import 'package:online_exam100/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../model/User.dart';
@injectable
class SignupUseCase {
  AuthRepository authRepository;
  SignupUseCase({required this.authRepository});
  Future<Result<User?>> invoke(
      String username,
      String firstName,
      String lastName,
      String email,
      String password,
      String rePassword,
      String phone,
      ) {
    return authRepository.signup(
        phone: phone,
        rePassword: rePassword,
        password: password,
        email: email,
        lastName: lastName,
        firstName: firstName,
        username: username);
  }
}
