import 'package:dio/dio.dart';
import 'package:online_exam100/data/api/api_consumer.dart';
import 'package:online_exam100/data/api/model/request/SignupRequest.dart';

import 'api_const.dart';
import 'package:injectable/injectable.dart';

import 'model/response/AuthResponse.dart';

@Injectable(as: ApiConsumer)
class DioConsumer   implements ApiConsumer{
  late Dio _dio;
  DioConsumer() {
    _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
    _dio.interceptors.add(
      LogInterceptor(responseHeader: true,
      error: true,responseBody: true,requestHeader: true,requestBody: true,request: true

      ),
    );
  }
  @override
  Future<AuthResponse?> signup(SignupRequest requestBody) async {
   try{
     var response = await _dio.post(ApiConstants.signupUrl, data: requestBody);
     AuthResponse authResponse = AuthResponse.fromJson(response.data);
     return authResponse;
   }
   catch(ex){
     print('Signup error: $ex');
     return null;
   }
  }

  @override
  Future<AuthResponse?> login({
    required String email,
    required String password,
  }) async {
    var response = await _dio.post(
        ApiConstants.signInUrl,
        data: {"email": email, "password": password});
    AuthResponse authResponse = AuthResponse.fromJson(response.data);
    return authResponse;
  }

  @override
  Future<String?> forgetPassword({
    required String email,
  }) async {
    var response = await _dio.post(
        ApiConstants.forgetPasswordApi,
        data: {"email": email});
     return response.data["message"];
  }
  @override
  Future<String?> emailVerification({
    required String  resetCode,
  }) async {
    var response = await _dio.post(
        ApiConstants.verifyResetCodeApi,
        data: {"resetCode": resetCode});
    return response.data["status"];
  }

  @override
  Future<AuthResponse?> resetPassword({
    required String  email,
    required String newPassword
  }) async {
    var response = await _dio.put(
        ApiConstants.resetPasswordApi,
        data: {
          "email":email,
          "newPassword":newPassword
        });
    AuthResponse authResponse=AuthResponse.fromJson(response.data);
    return authResponse;
  }
}
