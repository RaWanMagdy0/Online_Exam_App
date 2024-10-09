import 'dart:async';

import 'package:online_exam100/domain/common/api_result.dart';

import 'custom_exception.dart';

Future<Result<T>>executeApi<T>(Future<T> Function() apiCall)async{
  try {
    var result = await apiCall.call();
    return Success(data: result);
  } on TimeoutException catch (e) {
    return Fail(exception: NoInternetError());
  }  on Exception catch (e) {
    return Fail(exception: e);
  }

}