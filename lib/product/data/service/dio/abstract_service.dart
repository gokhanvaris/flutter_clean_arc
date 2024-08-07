import 'package:dio/dio.dart';
import 'package:flutter_clean_arc/product/data/service/dio/config/http_exception.dart';
import 'package:flutter_clean_arc/product/data/service/dio/config/http_manager.dart';

abstract class AbstractService<E> {
  final String path;
  final String? tag;
  final Dio _client;

  AbstractService(this.path, {this.tag, String? baseUrl, bool isAuth = false})
      : _client =
            HttpManager(baseUrl: baseUrl, isAuth: isAuth, tag: tag).client;

  Future<Response> get({
    String innerPath = "",
    CancelToken? cancelToken,
    Map<String, dynamic> queryParameters = const {},
  }) async {
    try {
      final response = await _client.get(
        "/$path/$innerPath",
        queryParameters: queryParameters,
        cancelToken: cancelToken ?? CancelToken(),
      );
      _checkResponse(response);
      return response;
    } catch (e) {
      throw HttpException.handleError(e);
    }
  }

  Future<Response> post({
    required E entity,
    required String innerPath,
    CancelToken? cancelToken,
    Map<String, dynamic> queryParameters = const {},
  }) async {
    try {
      final response = await _client.post(
        "/$path/$innerPath",
        data: entity,
        queryParameters: queryParameters,
        cancelToken: cancelToken ?? CancelToken(),
      );
      _checkResponse(response);
      return response;
    } catch (e) {
      throw HttpException.handleError(e);
    }
  }

  Future<Response> put({
    String innerPath = "",
    CancelToken? cancelToken,
    Map<String, String> queryParameters = const {},
  }) async {
    try {
      final response = await _client.put(
        "/$path/$innerPath",
        queryParameters: queryParameters,
        cancelToken: cancelToken ?? CancelToken(),
      );
      _checkResponse(response);
      return response;
    } catch (e) {
      throw HttpException.handleError(e);
    }
  }

  Future<Response> delete({
    String innerPath = "",
    CancelToken? cancelToken,
    Map<String, String> queryParameters = const {},
  }) async {
    try {
      final response = await _client.delete(
        "/$path/$innerPath",
        queryParameters: queryParameters,
        cancelToken: cancelToken ?? CancelToken(),
      );
      _checkResponse(response);
      return response;
    } catch (e) {
      throw HttpException.handleError(e);
    }
  }

  void _checkResponse(Response response) {
    if (response.statusCode == null ||
        response.statusCode! < 200 ||
        response.statusCode! > 299) {
      throw HttpException(response);
    }
  }

  Future<Response> postCustom({
    required String innerPath,
    required dynamic data,
    Map<String, dynamic> queryParameters = const {},
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      final response = await _client.post(
        "/$path/$innerPath",
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken ?? CancelToken(),
        options: options ?? Options(),
      );
      _checkResponse(response);
      return response;
    } catch (e) {
      throw HttpException.handleError(e);
    }
  }
}
