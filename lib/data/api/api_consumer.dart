import 'package:online_exam100/data/api/model/request/SignupRequest.dart';
import 'package:online_exam100/data/api/model/response/AuthResponse.dart';

abstract class ApiConsumer{
  Future<AuthResponse?> signup(SignupRequest requestBody);

  Future<AuthResponse?> login({
    required String email,
    required String password,
  });


  Future<String?> forgetPassword({
    required String email,
  });


  Future<String?> emailVerification({
    required String  resetCode,
  });

  Future<AuthResponse?> resetPassword({
    required String  email,
    required String newPassword
  });
}