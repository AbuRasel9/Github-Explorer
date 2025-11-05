import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../configs/utils/api_url.dart';
import '../../configs/utils/service/custom_interceptor.dart';
import '../exception/app_exception.dart';
import 'base_api_services.dart';

class DioApiService implements BaseApiServices {
  late final Dio _dio;

  DioApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiUrl.base,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
      ),
    );

    // Custom Interceptor added
    _dio.interceptors.add(CustomInterceptor());
  }

  /// GET request
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) print("🌐 [GET] => $url");
    try {
      final response = await _dio.get(url);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }



  /// Handle response codes
  dynamic _handleResponse(Response response) {
    if (kDebugMode) print("📥 Response Code: ${response.statusCode}");
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 404:
        throw FetchDataException("Not Found");
      default:
        throw FetchDataException(
          "Unexpected error: ${response.statusCode} ${response.statusMessage}",
        );
    }
  }

  /// Handle Dio-specific errors
  AppException _handleDioError(DioException e) {
    if (e.error is SocketException) {
      return NoInternetException("No Internet Connection");
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return FetchDataException("Connection Timeout");
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode ?? 0;
        if (statusCode == 401) return UnauthorisedException("Unauthorized");
        if (statusCode == 404) return FetchDataException("Not Found");
        if (statusCode >= 500) return FetchDataException("Server Error");
        return FetchDataException("Bad Response: ${e.message}");
      default:
        return FetchDataException("Unexpected Error: ${e.message}");
    }
  }
}
