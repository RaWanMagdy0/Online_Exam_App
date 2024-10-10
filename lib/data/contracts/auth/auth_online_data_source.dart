import 'package:online_exam100/core/api_resault/api_resault.dart';
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
 Future<Result<String?>> forgetPassword({required String  email } );
 Future<Result<String?>> verifyResetCode({required String  resetCode } );
 Future<Result<User?>> resetPassword({required String  email, required String newPassword} );

}


