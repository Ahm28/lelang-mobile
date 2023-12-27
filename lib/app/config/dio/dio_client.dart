import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'dio_interceptors.dart';

class DioClient {
  static final Dio _dio = Dio();

  Dio get instance => _dio;

  static final DioClient _singleton = DioClient._internal();

  factory DioClient({required String baseUrl}) {
    _singleton.instance.options.baseUrl = baseUrl;
    return _singleton;
  }

  DioClient._internal() {
    _dio.options.connectTimeout = const Duration(milliseconds: 5000);
    _dio.options.receiveTimeout = const Duration(milliseconds: 5000);

    _dio.interceptors.add(DioInterceptors());

    // if(debug()) {}
    if (!kReleaseMode) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ));
    }
  }
}
