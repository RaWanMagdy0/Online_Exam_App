import 'package:injectable/injectable.dart';
import 'package:online_exam100/core/api_resault/api_resault.dart';
import 'package:online_exam100/domain/repository/auth_repository.dart';
@injectable
class ForgetPasswordUseCase{
  AuthRepository authRepository;

  ForgetPasswordUseCase(this.authRepository);

  Future<Result<String?>>invoke({required String email}){
    return authRepository.forgetPassword(email: email);
  }
}