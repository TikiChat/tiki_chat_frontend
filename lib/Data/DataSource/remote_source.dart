import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tikichat_app/Utils/Enum/api_enum.dart';
import 'package:tikichat_app/Utils/Env/env.dart';
import 'package:tikichat_app/Utils/Exception/tk_exception.dart';
import 'package:tikichat_app/Utils/tk_logger.dart';
import 'package:tikichat_app/Utils/utils.dart';

typedef JsonConverter<T> = T Function(Object? json);

class RemoteSource {
  final Dio dio = Dio();

  Future<T> request<T>({
    required ApiTypeEnum type,
    required String path,
    required JsonConverter<T>? converter,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      final res = await callApiByType(type, path, data, query, options);
      final json = res.data;
      const TkLogger().data(data: json);

      if (converter != null && json != null) {
        return converter(json["data"]);
      } else {
        return json as T;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        const TkLogger().error(data: {
          "path": e.requestOptions.path,
          "uri": e.requestOptions.uri,
          "data": e.requestOptions.data
        });
        throw TkException(e.response!.statusCode!, e.response!.data['message']);
      }
      throw Exception(e.response);
    } catch (e) {
      throw Exception();
    }
  }

  Future<Response> callApiByType<T>(
    ApiTypeEnum type,
    String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Options? options,
  ) async {
    switch (type) {
      case ApiTypeEnum.GET:
        return await get(path: path, query: query);
      case ApiTypeEnum.POST:
        return await post(path: path, data: data);
      case ApiTypeEnum.PUT:
        return await put(path: path, data: data, query: query);
      case ApiTypeEnum.DELETE:
        return await delete(path: path, data: data, query: query);
      default:
        throw Exception("API TYPE ERROR");
    }
  }

  Future<Response> get({required String path, required Map<String, dynamic>? query}) async {
    final url = getUrl(Env.serverPath, path, query).toString();
    Response response = await dio.get(url);
    return response;
  }

  Future<Response> post(
      {required String path, Map<String, dynamic>? data, Map<String, dynamic>? query}) async {
    final url = getUrl(Env.serverPath, path, query).toString();
    Response response = await dio.post(url,
        data: jsonEncode(data), options: Options(headers: {'Device-ID': 'iphone'}));
    return response;
  }

  Future<Response> put({
    required String path,
    required Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
  }) async {
    final url = getUrl(Env.serverPath, path, query).toString();
    Response response = await dio.put(url, data: jsonEncode(data));
    return response;
  }

  Future<Response> delete(
      {required String path, Map<String, dynamic>? data, Map<String, dynamic>? query}) async {
    final url = getUrl(Env.serverPath, path, query).toString();
    Response response = await dio.delete(url, data: jsonEncode(data));

    return response;
  }
}
