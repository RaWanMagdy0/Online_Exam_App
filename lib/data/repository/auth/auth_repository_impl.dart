import 'package:online_exam100/core/api_resault/api_resault.dart';
import 'package:online_exam100/data/contracts/auth/auth_online_data_source.dart';
import 'package:online_exam100/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/model/User.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthOnlineDataSource authOnlineDataSource;
  AuthRepositoryImpl({required this.authOnlineDataSource});
  @override
  Future<Result<User>> signup(
      {required String phone,
      required String rePassword,
      required String password,
      required String email,
      required String lastName,
      required String firstName,
      required String username}) {
    return authOnlineDataSource.signup(
        phone: phone,
        rePassword: rePassword,
        password: password,
        email: email,
        lastName: lastName,
        firstName: firstName,
        username: username);
  }

  Future<Result<User?>> login(
      {required String email, required String password}) {
    return authOnlineDataSource.login(email: email, password: password);
  }

  @override
  Future<Result<String?>> forgetPassword({required String email}) {
    return authOnlineDataSource.forgetPassword(email: email);
  }

  @override
  Future<Result<User?>> resetPassword(
      {required String email, required String newPassword}) {
    return authOnlineDataSource.resetPassword(
        email: email, newPassword: newPassword);
  }

  @override
  Future<Result<String?>> verifyResetCode({required String resetCode}) {
    return authOnlineDataSource.verifyResetCode(resetCode: resetCode);
  }
}
