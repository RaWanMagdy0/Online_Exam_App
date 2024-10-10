import 'package:dio/dio.dart';
import 'package:online_exam100/core/error/error.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(data: result);
  } on DioException catch (e) {
    return Fail(serverError: ServerError.fromDioException(e));
  } on Exception catch (e) {
    return Fail(
        serverError: ServerError(
            errorMessage:
                "An unexpected error occurred. Please try again later."));
  }
}

sealed class Result<T> {}

class Success<T> implements Result<T> {
  T? data;
  Success({this.data});
}

class Fail<T> implements Result<T> {
  ServerError? serverError;
  Fail({required this.serverError});
}
