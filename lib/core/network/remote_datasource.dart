import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RemoteDataSource {
  final _dio = Dio(
    BaseOptions(baseUrl: dotenv.env['BASE_URL']!, headers: {
      "accept": "application/json",
    }),
  )..interceptors.add(
      PrettyDioLogger(requestHeader: true),
    );

  Future<Response> get({required String endpoint}) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getWithToken({required String endpoint}) async {
    try {
      final dio = _dio;

      dio.options.headers.addAll({
        "Authorization": dotenv.env['TOKEN']
      });

      final response = await dio.get(endpoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
