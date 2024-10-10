import 'package:online_exam100/core/api_resault/api_resault.dart';
import 'package:online_exam100/domain/model/User.dart';
import 'package:online_exam100/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  AuthRepository authRepository;

  ResetPasswordUseCase(this.authRepository);

  Future<Result<User?>> invoke(
      {required String email, required String newPassword}) {
    return authRepository.resetPassword(email: email, newPassword: newPassword);
  }
}
