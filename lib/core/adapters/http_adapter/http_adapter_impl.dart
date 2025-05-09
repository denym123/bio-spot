import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;

import '../../core.dart';

class HttpAdapterImpl implements HttpAdapter {
  final LocalSecureStorage _localSecureStore;

  final _dio = dio.Dio(
    dio.BaseOptions(
      receiveDataWhenStatusError: true,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      contentType: dio.Headers.jsonContentType,
      followRedirects: false,
      headers: {
        'accept': dio.Headers.jsonContentType,
        'user-agent': Platform.operatingSystem,
      },
    ),
  );

  HttpAdapterImpl({
    required LocalSecureStorage localSecureStore,
  }) : _localSecureStore = localSecureStore;

  dio.Dio get dioInstance {
    return _dio;
  }

  @override
  Future<dio.Response?> request({
    required HttpMethod httpMethod,
    required String url,
    required bool needsAuthorization,
    bool refreshAuthorization = false,
    bool throwException = true,
    data,
    String? pathFile,
  }) async {
    const String baseUrl = "http://191.252.60.138:300/api/v1";
    try {
      url = baseUrl + url;

      log('[HTTP] Request type ${httpMethod.name()} in URL $url');

      if (data != null) log('[HTTP] with body ${jsonEncode(data)}');
      if (needsAuthorization) await _addAuthorization();
      late dio.Response response;

      switch (httpMethod) {
        case HttpMethod.get:
          response = await dioInstance.get(
            url,
          );
          break;
        case HttpMethod.post:
          response = await dioInstance.post(
            url,
            data: data,
          );
          break;
        case HttpMethod.patch:
          response = await dioInstance.patch(
            url,
            data: data,
          );
          break;
        case HttpMethod.put:
          response = await dioInstance.put(
            url,
            data: data,
          );
          break;
        case HttpMethod.delete:
          response = await dioInstance.delete(
            url,
            data: data,
          );
          break;
        case HttpMethod.download:
          response = await dioInstance.download(
            url,
            pathFile,
          );
          break;
        default:
          throw HttpException(
            url: url,
            dioException: dio.DioException(
              requestOptions: dio.RequestOptions(path: url),
              response: dio.Response(
                  statusCode: 3, requestOptions: dio.RequestOptions(path: url)),
            ),
          );
      }

      if (response.data is Map && response.data['message'] != null) {
        Messages.success(response.data['message']);
      }

      return response;
    } on dio.DioException catch (e) {
      _exceptionHandler(data, e, url);
    }
    return null;
  }

  void _exceptionHandler(dynamic data, dio.DioException e, String url) {
    log('[HTTP] ${e.response}');

    if (e.response?.data is Map && e.response?.data['message'] != null) {
      Messages.success(e.response?.data['message']);
    }

    HttpException httpException =
        HttpException(dioException: e, url: url, data: data);

    throw httpException;
  }

  Future<void> _addAuthorization() async {
    final authToken =
        await _localSecureStore.read(LocalSecureStorageConstants.ACCESS_TOKEN);
    log('[HTTP] with Authorization $authToken');
    _dio.options.headers['Authorization'] = 'Bearer $authToken';
  }
}
