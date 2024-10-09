import 'package:dio/dio.dart';
import 'package:online_exam100/data/api/model/request/SignupRequest.dart';
import 'package:online_exam100/domain/model/User.dart';

import 'api_const.dart';
import 'package:injectable/injectable.dart';

import 'model/response/AuthResponse.dart';

@singleton
@injectable
class ApiManger {
  late Dio _dio;
  ApiManger() {
    _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  }
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
}
