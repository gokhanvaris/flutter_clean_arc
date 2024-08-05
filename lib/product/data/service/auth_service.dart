import 'package:dio/dio.dart';
import 'package:flutter_clean_arc/product/data/service/dio/abstract_service.dart';
import 'package:flutter_clean_arc/product/utility/models/req/user_request_model.dart';

class AuthService extends AbstractService {
  final String path;
  final String tag;
  AuthService({
    this.path = "auth",
    this.tag = "connect",
  }) : super(path, tag);

  Future<Response<dynamic>> connect(UserRequestModel model) async {
    try {
      final response = await postCustom(
        innerPath: 'connect',
        data: model.toJson(),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
