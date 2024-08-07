import 'package:dio/dio.dart';

class HttpException implements Exception {
  final Response? response;

  HttpException(this.response);

  @override
  String toString() => 'HttpException{response: $response}';

  static String handleError(Object error) {
    if (error is DioException) {
      return _handleDioError(error);
    }
    return 'unknownError';
  }

  static String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'timeoutError';
      case DioExceptionType.badCertificate:
        return 'badCertificateError';
      case DioExceptionType.connectionError:
        return 'connectionError';
      case DioExceptionType.cancel:
        return 'requestCancelled';
      default:
        return 'unknownError';
    }
  }

  static String _handleBadResponse(Response? response) {
    final statusCode = response?.statusCode;
    if (statusCode == 503 || statusCode == 502) {
      return 'maintenance';
    } else if (statusCode == 500) {
      return response?.data['error'] ?? 'serverError';
    } else if (statusCode == 403) {
      if (response?.data['message'] == 'requiredUpdate') {
        return 'requiredUpdate';
      }
      return 'forbiddenError';
    }
    return 'unknownError';
  }
}
