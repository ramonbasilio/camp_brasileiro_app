// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, camel_case_types

import 'package:camp_brasileiro_app/controladores/controlador_api.dart';
import 'package:camp_brasileiro_app/modelos/modelo_rodada_completa.dart';
import 'package:camp_brasileiro_app/modelos/modelo_tabela.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class repositorio extends ChangeNotifier {

  final List<modeloTime> _listaDetimes = [];
  List<modeloTime> get listaDetimes => _listaDetimes;


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

  Future<void> carregaDadosEstaticos() async {
    String jsonString = await rootBundle.loadString('tabela.json');
    List<dynamic> json = jsonDecode(jsonString);

    for (var time in json) {
      modeloTime _modeloTime = modeloTime.fromJson(time);
      _listaDetimes.add(_modeloTime);
    }
    notifyListeners();
  }

  Future<List<modeloRodada>> callRodadas(String time) async {
    HttpManager httpManager = HttpManager();
    List<modeloRodada> rodadas = [];
    List<Future<dynamic>> listaEndPoints = [];
    List<modeloRodada> resumoPartida = [];

    for (int i = 1; i <= 5; i++) {
      listaEndPoints.add(httpManager.restRequest(
          url: 'https://api.api-futebol.com.br/v1/campeonatos/10/rodadas/$i',
          method: HttpMethod.get));
    }
    final resultado = await Future.wait(listaEndPoints);

    for (var element in resultado) {
      //print('passou aqui...');
      element['partidas'].forEach((partida) {
        //print('entrou no segundo forEach...');
        if (partida['time_visitante']['nome_popular'] == time ||
            partida['time_mandante']['nome_popular'] == time) {
          //print('entrou no if...');
          modeloRodada rodada = modeloRodada(
              nome: element['nome'],
              slug: element['slug'],
              rodada: element['rodada'],
              status: element['status'],
              proxima_rodada: element['proxima_rodada'],
              rodada_anterior: element['rodada_anterior'],
              partidas: partida);
          resumoPartida.add(rodada);
        }
      });
    }

    // resumoPartida.forEach((element) {
    //   print(element.partidas['placar']);
    //  });

    return resumoPartida;
  }

  Future<List<modeloRodada>> todasRodadas() async {
    HttpManager httpManager = HttpManager();
    List<modeloRodada> resumoPartida = [];
    List<Future<dynamic>> _listaEndPoints = [];

    for (int i = 1; i < 5; i++) {
      _listaEndPoints.add(httpManager.restRequest(
          url: 'https://api.api-futebol.com.br/v1/campeonatos/10/rodadas/${i}',
          method: HttpMethod.get));
    }
    final _dados = await Future.wait(_listaEndPoints);
  
    _dados.forEach((element) {
      modeloRodada _modeloRodada = modeloRodada.fromJson(element);
      resumoPartida.add(_modeloRodada);
    });

    notifyListeners();
    return resumoPartida;
  }
}
