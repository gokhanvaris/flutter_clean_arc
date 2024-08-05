import 'package:dio/dio.dart';

class HttpException implements Exception {
  Response response;

  HttpException(
    this.response,
  );

  @override
  String toString() {
    return 'HttpException{response: $response}';
  }

  static String handleError(Exception? error) {
    String? errorDescription = "";
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.badResponse:
          if (error.response?.statusCode == 503 ||
              error.response?.statusCode == 502) {
            errorDescription = 'maintenance';
          } else if (error.response?.statusCode == 500) {
            errorDescription = error.response?.data["error"];
          } else if (error.response?.statusCode == 403) {
            if (error.response?.data["message"] == 'requiredUpdate') {
              errorDescription = 'requiredUpdate';
            }
          }
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = error.response?.data;
          break;
        case DioExceptionType.connectionError:
          errorDescription = error.response?.data;
          break;
        case DioExceptionType.badCertificate:
          errorDescription = error.response?.data;
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = error.response?.data;
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = error.response?.data;
          break;
        case DioExceptionType.cancel:
          errorDescription = error.response?.data;
          break;
        case DioExceptionType.unknown:
          errorDescription = error.response?.data;
          break;
      }
    }
    return errorDescription ?? 'unknownError';
  }
}
