import 'package:online_exam100/data/api/model/UserDto.dart';
import 'package:online_exam100/data/contracts/auth/auth_online_data_source.dart';
import 'package:online_exam100/domain/common/ApiExtenceptions.dart';
import 'package:online_exam100/domain/common/api_result.dart';
import 'package:online_exam100/domain/model/User.dart';
import 'package:injectable/injectable.dart';

import '../../api/api_manger.dart';
import '../../api/model/request/SignupRequest.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  ApiManger apiManger;
  AuthOnlineDataSourceImpl(this.apiManger);
  @override
  Future<Result<User>> signup({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    var body = SignupRequest(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
    return executeApi<User>(
      () async {
        var response = await apiManger.signup(
           body);
        var userDto = UserDto(token: response?.token);
        return userDto.toUser();
      },
    );
  }
}
