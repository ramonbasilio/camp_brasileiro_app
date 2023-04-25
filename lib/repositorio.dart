// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, camel_case_types

import 'package:camp_brasileiro_app/controlador_api.dart';
import 'package:camp_brasileiro_app/tabela_modelo.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class repositorio {
  Future<List<modeloTime>> callApi() async {
    HttpManager httpManager = HttpManager();
    List<modeloTime> listaDetimes = [];
    List respostaApi = await httpManager.restRequest(
        url: EndPoints.tabelaBrasileirao, method: HttpMethod.get);
    for (var time in respostaApi) {
      modeloTime _modeloTime = modeloTime.fromJson(time);
      listaDetimes.add(_modeloTime);
    }
    return listaDetimes;
  }

  Future<List<modeloTime>> carregaDadosEstaticos() async {
    String jsonString = await rootBundle.loadString('tabela.json');
    List<dynamic> json = jsonDecode(jsonString);
    List<modeloTime> listaDetimes = [];
    for (var time in json) {
      modeloTime _modeloTime = modeloTime.fromJson(time);
      listaDetimes.add(_modeloTime);
    }
    return listaDetimes;
  }
}
