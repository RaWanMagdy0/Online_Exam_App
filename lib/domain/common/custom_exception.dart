import 'package:dio/dio.dart';

class ServerError implements Exception{
  String?errorMessage;
  String?statusCode;
  ServerError({required this.errorMessage,required this.statusCode});

}

class DioHttpException implements Exception{
  String?errorMessage;
  DioHttpException({required this.errorMessage});



  factory DioHttpException.fromDioException(DioException error) {
    String ? errorMessage;
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = "Connection timed out. Please check your internet connection and try again.";
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "Sending data timed out. Please try again later.";
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "Receiving data timed out. Please check your connection.";
        break;
      case DioExceptionType.badCertificate:
        errorMessage = "The server's certificate is not trusted. Please check your network security.";
        break;
      case DioExceptionType.badResponse:
        print("121 :errror");
        return DioHttpException.handleDioResponse(error.response);
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionError:
        errorMessage = "Connection failed. Please check your network connection.";
        break;
      case DioExceptionType.unknown:
        errorMessage = "An unknown error occurred. Please try again.";
        break;
      default:
        errorMessage = "Something went wrong. Please try again later.";
        break;
    }

        return  DioHttpException(errorMessage: errorMessage);
  }



  factory   DioHttpException.handleDioResponse(Response<dynamic>? response) {
   print(response?.statusCode);
    String? errorMessage = response?.data["message"];
    if (response?.statusCode == 400) {
      errorMessage ??= "Invalid request. Please check the data and try again.";
    } else if (response?.statusCode == 401 || response?.statusCode == 403) {
      errorMessage ??= "Unauthorized access. Please log in and try again.";
    } else if (response?.statusCode == 404) {
      errorMessage ??= "Resource not found. The requested item does not exist.";
    } else if (response?.statusCode == 409) {
      errorMessage ??= "Conflict detected. The resource already exists or conflicts with the current state.";
    } else if (response?.statusCode == 500) {
      errorMessage ??= "Internal server error. Please try again later.";
    } else {
      errorMessage = errorMessage ?? "An unexpected error occurred. Please try again.";
    }
    return DioHttpException(errorMessage: errorMessage);
  }

}


class NoInternetError implements Exception {}
class InternetError implements Exception {}
