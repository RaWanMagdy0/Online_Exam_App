import 'package:injectable/injectable.dart';
import 'package:online_exam100/domain/common/api_result.dart';
import 'package:online_exam100/domain/model/User.dart';
import 'package:online_exam100/domain/repository/auth_repository.dart';
@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase(this.authRepository);


  Future<Result<User?>>invoke({
    required String email,
    required String password,
  }){
    return authRepository.login(email: email, password: password);
  }
}