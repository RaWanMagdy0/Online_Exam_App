import 'package:online_exam100/data/contracts/auth/auth_online_data_source.dart';
import 'package:online_exam100/data/datasource/auth/auth_online_data_source_impl.dart';
import 'package:online_exam100/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/common/api_result.dart';
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
}
