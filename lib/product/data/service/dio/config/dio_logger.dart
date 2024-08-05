import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioLogger {
  static Logger logger = Logger();
  static void onSend(String tag, RequestOptions options) {
    if (options.data.runtimeType == FormData) return;

    logger.d(
      '$tag - Request Path : [${options.method}] ${options.baseUrl}${options.path}'
      '$_divider'
      '$tag - Request Data : ${options.data is Map ? jsonEncode(options.data) : jsonEncode(options.data)}'
      '$_divider'
      '$tag - Request Params : ${jsonEncode(options.queryParameters)}',
    );
  }

  static void onSuccess(
    String tag,
    Response response,
  ) {
    logger.d(
      '$tag - Response Path : [${response.requestOptions.method}] ${response.requestOptions.baseUrl}${response.requestOptions.path}'
      '$_divider'
      '$tag - Response statusCode : ${response.statusCode}'
      '$_divider'
      '$tag - Response data : ${response.data is String ? response.data : jsonEncode(response.data)}',
    );
  }

  static void onError(String? tag, DioException? error) {
    if (null != error?.response) {
      logger.d(
        '$tag - Error Path : [${error?.response?.requestOptions.method}] ${error?.response?.requestOptions.baseUrl}${error?.response?.requestOptions.path}'
        '$_divider'
        '$tag - Error Data : ${error?.response?.data is Map ? jsonEncode(error!.response!.data) : error?.response?.data}'
        '$_divider'
        '$tag - Error Status Code : ${error?.response?.statusCode}'
        '$_divider'
        '$tag - Error Message : ${error?.message}',
      );
    } else {
      logger.d(
        '$tag - Error Message : ${error?.message}',
      );
    }
  }

  static String get _divider => '\n${'-' * 30}\n';
}
