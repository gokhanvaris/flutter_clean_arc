import 'package:dio/dio.dart';
import 'package:flutter_clean_arc/product/data/service/dio/abstract_service.dart';
import 'package:flutter_clean_arc/product/data/service/dio/config/http_exception.dart';
import 'package:flutter_clean_arc/product/utility/models/req/user_request_model.dart';

class AuthService extends AbstractService<UserRequestModel> {
  AuthService({
    String path = "auth",
    String tag = "connect",
  }) : super(path, tag: tag);

  Future<Response<dynamic>> connect(UserRequestModel model) async {
    try {
      final response = await postCustom(
        innerPath: 'connect',
        data: model.toJson(),
      );
      return response;
    } catch (e) {
      throw HttpException.handleError(e);
    }
  }
}
