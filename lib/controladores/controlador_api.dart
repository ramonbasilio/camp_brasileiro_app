import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class HttpMethod {
  static const String get = 'GET';
}

abstract class EndPoints {
  static const String tabelaBrasileirao =
      'https://api.api-futebol.com.br/v1/campeonatos/10/tabela';
}

class HttpManager {
  Future<dynamic> restRequest({
    required String url,
    required String method,
  }) async {
    Map<String, dynamic> defaultHeaders = ({
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
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print(response.statusCode);
        ErrorWidget('Erro ao buscar dados');
      }
      //print('Resposta da Api: ${response.data}');
    } on DioError catch (error) {
      print(error);
      return ErrorWidget('Erro ao buscar dados: ${error.response?.data}');
      //return error.response?.data;
    }
  }
}
