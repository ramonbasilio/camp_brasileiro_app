import 'package:dio/dio.dart';

abstract class HttpMethod {
  static const String get = 'GET';
}

abstract class EndPoints{
  static const String tabelaBrasileirao = 'https://api.api-futebol.com.br/v1/campeonatos/10/tabela';
}

class HttpManager {
  Future<dynamic> restRequest({
    required String url,
    required String method,
    Map? headers,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'Authorization': 'Bearer ',
      });

    Dio dio = Dio();
    try {
      Response response = await dio.request(
        url,
        options: Options(
          headers: defaultHeaders,
          method: method,
        ),
      );
      return response.data;
    } on DioError catch (error) {
      return error.response?.data;
    }
  }
}
