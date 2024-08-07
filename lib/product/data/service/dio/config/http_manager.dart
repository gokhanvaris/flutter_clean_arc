import 'package:dio/dio.dart';
import 'package:flutter_clean_arc/product/utility/constants/app_constants.dart';
import 'package:flutter_clean_arc/product/utility/models/res/user_model.dart';
import 'dio_logger.dart';

class HttpManager {
  final Dio _dio = Dio();
  static String? token;
  static String? refreshToken;
  static String? cookie;
  static User? user;

  HttpManager({String? baseUrl, bool? isAuth, String? tag}) {
    _dio.options
      ..baseUrl = baseUrl ?? AppConstats.instance.baseUrl
      ..contentType = Headers.jsonContentType;

    if (isAuth == true) {
      // Add auth-related headers if needed
    }

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          DioLogger.onSend(tag ?? 'unknown tag', options);
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          DioLogger.onSuccess(tag ?? 'unknown tag', response);
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          DioLogger.onError(tag, error);
          return handler.next(error);
        },
      ),
    );
  }

  Dio get client => _dio;
}
