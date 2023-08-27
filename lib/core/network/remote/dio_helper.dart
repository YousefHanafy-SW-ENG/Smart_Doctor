import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static initialize() {
    dio = Dio(
      BaseOptions(
        // baseUrl: 'https://thick-wings-read-156-192-234-28.loca.lt/api/extract',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
    required String token,
  }) async {
    // dio!.options.headers = {
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer $token',
    // };

    try {
      return await dio!.get(
        url,
        queryParameters: query,
      );
    } on DioError catch (e) {
      return e.response;
    }
  }

  static Future<Response> postData({
    // required String url,
    // Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    return await dio!.post(
      'https://jsonplaceholder.typicode.com/albums',
      // queryParameters: query,
      data: data,
    );
  }
}
