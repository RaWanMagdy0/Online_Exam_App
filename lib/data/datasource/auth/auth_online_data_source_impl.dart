import 'package:online_exam100/core/api_resault/api_resault.dart';
import 'package:online_exam100/data/api/api_consumer.dart';
import 'package:online_exam100/data/api/model/UserDto.dart';
import 'package:online_exam100/data/contracts/auth/auth_online_data_source.dart';
import 'package:online_exam100/domain/model/User.dart';
import 'package:injectable/injectable.dart';

import '../../api/api_manger.dart';
import '../../api/model/request/SignupRequest.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  ApiConsumer apiConsumer;
  AuthOnlineDataSourceImpl(this.apiConsumer);
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
        var response = await apiConsumer.signup(
           body);
        var userDto = UserDto(token: response?.token);
        return userDto.toUser();
      },
    );
  }



  @override
  Future<Result<User?>> login(
      {required String email, required String password}) async {
    return executeApi<User?>(
          () async {
        var authResponse =
        await apiConsumer.login(email: email, password: password);
        var userDto = UserDto(token: authResponse?.token);
        return userDto.toUser();
      },
    );
  }

  @override
  Future<Result<String?>> forgetPassword({required String email}) async{
    return executeApi<String?>(
      () async{
        String ?  massage =await apiConsumer.forgetPassword(email: email);
         return massage;
        },
    );
  }

  @override
  Future<Result<User?>> resetPassword({required String email, required String newPassword}) {
    return executeApi<User?>(
            () async {
              var authResponse = await
              apiConsumer.resetPassword(email: email,
                  newPassword: newPassword);
              var userDto = UserDto(token: authResponse?.token);
              return userDto.toUser();
            }
            );
        }

  @override
  Future<Result<String?>> verifyResetCode({required String resetCode}) {
    return executeApi<String?>(
          () async{
        String ?  massage =await apiConsumer.emailVerification(resetCode: resetCode);
        return massage;
      },
    );
  }
}
