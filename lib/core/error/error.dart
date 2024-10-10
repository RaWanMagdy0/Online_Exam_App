import 'package:dio/dio.dart';

class ServerError implements Exception{
  String?errorMessage;
  ServerError({required this.errorMessage});



  factory ServerError.fromDioException(DioException error) {
    print(error.response?.statusCode);
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
        return ServerError.handleDioResponse(error.response);
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionError:
        errorMessage = "Connection failed. "
            "Please check your network connection.";
        break;
      case DioExceptionType.unknown:
        errorMessage = "An unknown error occurred. Please try again.";
        break;
      default:
        errorMessage = "Something went wrong. Please try again later.";
        break;
    }

    return  ServerError(errorMessage: errorMessage);
  }


  factory   ServerError.handleDioResponse(Response<dynamic>? response) {
    String? errorMessage ;
    if (response?.statusCode == 400) {
      errorMessage=  response?.data["message"] ?? "Invalid request. Please check the data and try again.";
    } else if (response?.statusCode == 401 || response?.statusCode == 403) {
      errorMessage = response?.data["message"] ?? "Unauthorized access. Please log in and try again.";
    } else if (response?.statusCode == 404) {
      errorMessage =  "Resource not found. The requested item does not exist.";
    } else if (response?.statusCode == 409) {
      errorMessage = response?.data["message"] ??"Conflict detected. The resource already exists or conflicts with the current state.";
    } else if (response?.statusCode == 500) {
      errorMessage = "Internal server error. Please try again later.";
    } else {
      errorMessage = "An unexpected error occurred. Please try again.";
    }
    return ServerError(errorMessage: errorMessage);
  }

}


