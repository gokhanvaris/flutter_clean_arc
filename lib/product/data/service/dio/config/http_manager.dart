import 'package:dio/dio.dart';
import 'package:flutter_clean_arc/product/utility/constants/app_constants.dart';
import 'package:flutter_clean_arc/product/utility/models/res/user_model.dart';

import 'dio_logger.dart';

class HttpManager {
  static String? token;
  static String? refreshToken;
  static String? cookie;
  static User? user;
  final bool? isAuth;
  final String? tag;
  final String? baseUrl;

  final _dio = Dio();

  HttpManager({this.tag, this.baseUrl, this.isAuth}) {
    _dio.options.baseUrl = baseUrl ?? AppConstats.instance.baseUrl;
    _dio.options.contentType = Headers.jsonContentType;

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // options.headers["X-API-USER-CODE"] = HttpManager.user?.userCode;

          DioLogger.onSend(tag!, options);
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          DioLogger.onSuccess(tag!, response);
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          DioLogger.onError(tag!, error);
          return handler.next(error);
        },
      ),
    );
  }

  Dio get client => _dio;
}
