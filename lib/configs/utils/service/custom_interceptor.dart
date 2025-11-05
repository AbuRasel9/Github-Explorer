import 'dart:developer';

import 'package:dio/dio.dart';

class CustomInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log(
      " Url:${options.baseUrl}${options.path}\n ➡️ Request:${options.data}",
    );
    super.onRequest(options, handler); // Continue with the request
  }


  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(
      "Status Code:${response.statusCode}\n ➡️ Data:${response.data}",
    );

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      "Status code:${err.response?.statusCode}\n Error occurred ${err.message}",
    );
    super.onError(err, handler);
  }
}