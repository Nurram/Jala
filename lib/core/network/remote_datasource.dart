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
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImZiMzMxZmZhMzkxY2FjNWZmNDJhNjNlZWU3MjQzODQwY2RhNzIwYTc1ZDIwMzA3ZTU0MThiYjQ5ZDBjYmMyMGE5N2U3YTI5MjFhYmMyYTllIn0.eyJhdWQiOiIxIiwianRpIjoiZmIzMzFmZmEzOTFjYWM1ZmY0MmE2M2VlZTcyNDM4NDBjZGE3MjBhNzVkMjAzMDdlNTQxOGJiNDlkMGNiYzIwYTk3ZTdhMjkyMWFiYzJhOWUiLCJpYXQiOjE3MTMwMjk1ODAsIm5iZiI6MTcxMzAyOTU4MCwiZXhwIjoxNzQ0NTY1NTgwLCJzdWIiOiIxMzEyIiwic2NvcGVzIjpbXX0.RliuVHp7mGPc2Hyg8bURcXhfFYPEtosZMwrUb3jErdTtD2GpcZw0HzZ04fR3vtlg8OqIa8BSm_U72XJwABvt1MsYZMJ65HJV8HKvDg2IX7OQbjeG0hAtDfQV9pgPgKhk2F3S-7SQC0tg1rejwiW6xNJuMfYxH5l2djYlFLCFb5HrKjAg_2eH-GPDrqU3-idqzvFVpAu0sQnT465tQPFFPCH3kOizdevNDxUXs62iD0iOmG0A9RBaBC_JN37MRRAPDC8GlqiuEBVfznTkjBdMdx7zWh1-SPRDPytQv5vhIJpgEkatwYz7yTLp0swvlGQ31_-C8Tj8OrMVUrZfIWfFUdlzd11CaMsWkLj9PlKpjoCMt7cKwkzPDgLgDYkBQO0Tn7PAbqTfTYQUYJCbQuA1wzGfcA6w_oNeZRU2xP7mok0WbVlFCTlZnAxkt15a_XolE0Cyc9g6a_Z2afOb9YmN6lJDWa6rS-WCviPWBhbB8q2K3ww_4kxjowe1FTRiH-gto8fBFkbqjhbBBNXOZjwcjJqL3-dZMKCETXuk5BX53m4FTGKv-inT3bMYSVbCZHsoqgem0qEZE11u3MbviiJKEh5Vh07DK1nF6d07xCyUbObndgzfo7Y8aWuLofnAItqPyRa2r0KsaMszVH4yKvu43NXJ68ZlfoxEyWyX3zcWIa0"
      });

      final response = await dio.get(endpoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
