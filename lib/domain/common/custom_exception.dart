class ServerError implements Exception{
  String?errorMessage;
  String?statusCode;
  ServerError({required this.errorMessage,required this.statusCode});

}

class DioHttpException implements Exception{
  String?errorMessage;
  DioHttpException({required this.errorMessage});
}
class NoInternetError implements Exception {}
class InternetError implements Exception {}
