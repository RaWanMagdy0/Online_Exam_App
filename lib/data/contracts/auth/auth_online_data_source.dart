import 'package:online_exam100/domain/common/api_result.dart';
import 'package:online_exam100/domain/model/User.dart';

abstract class AuthOnlineDataSource {
 Future<Result<User>> signup(
      {required String phone,
      required String rePassword,
      required String password,
      required String email,
      required String lastName,
      required String firstName,
      required String username});

 Future<Result<User?>> login({required String email, required String password}) ;


}


