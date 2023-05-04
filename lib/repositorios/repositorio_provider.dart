// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, camel_case_types

import 'package:camp_brasileiro_app/controladores/controlador_api.dart';
import 'package:camp_brasileiro_app/modelos/rodada_modelo_completa.dart';
import 'package:camp_brasileiro_app/modelos/rodada_modelo_time.dart';
import 'package:flutter/material.dart';

import '../modelos/tabela_modelo.dart';

class repositorioProvider extends ChangeNotifier {
  List<modeloRodada> _todasRodadas = [];
  List<modeloRodada> get resumoDasPartidas => _todasRodadas;

  List<modeloRodadaTime> _rodadasDoTime = [];
  List<modeloRodadaTime> get rodadasDoTime => _rodadasDoTime;

  List<modeloTime> _tabelaCompleta = [];
  List<modeloTime> get tabelaCompleta => _tabelaCompleta;

  Future<List<modeloRodada>?> todasRodadas() async {
    HttpManager httpManager = HttpManager();
    final List<Future<dynamic>> _listaEndPoints = [];
    for (int i = 1; i <= 20; i++) {
      _listaEndPoints.add(httpManager.restRequest(
          url: 'https://api.api-futebol.com.br/v1/campeonatos/10/rodadas/${i}',
          method: HttpMethod.get));
    }
    final _dados = await Future.wait(_listaEndPoints);
    try{
    _dados.forEach((element) {
      modeloRodada _modeloRodada = modeloRodada.fromJson(element);
      resumoDasPartidas.add(_modeloRodada);
    });
    }
    catch (erro){
      print('Erro: $erro');
    }

    _todasRodadas = resumoDasPartidas;
    notifyListeners();
    return _todasRodadas;
  }

  Future<List<modeloTime>> tabelaCampeonato() async {

    HttpManager httpManager = HttpManager();
    List respostaApi = await httpManager.restRequest(
        url: EndPoints.tabelaBrasileirao, method: HttpMethod.get);
    for (var time in respostaApi) {
      modeloTime _modeloTime = modeloTime.fromJson(time);
      _tabelaCompleta.add(_modeloTime);
    }
    _tabelaCompleta = tabelaCompleta;
    notifyListeners();
    return tabelaCompleta;
  }

  List<modeloRodadaTime> proximasRodadasFunc(String time, List<modeloRodada> todasRodadasTime) {
    for (var timeRodada in todasRodadasTime) {
         timeRodada.partidas.forEach((partida) {
        if (partida['time_visitante']['nome_popular'] == time ||
            partida['time_mandante']['nome_popular'] == time) {
          try{
          modeloRodadaTime rodada = modeloRodadaTime(
              nome: timeRodada.nome,
              slug: timeRodada.slug,
              rodada: timeRodada.rodada,
              status: timeRodada.status,
              proxima_rodada: timeRodada.proxima_rodada,
              rodada_anterior: timeRodada.rodada_anterior,
              partidas: partida);
          _rodadasDoTime.add(rodada);

          }
          catch (e){
            print('Erro proximasRodadasFunc $e');
          }
        }
      });
    }
    _rodadasDoTime = rodadasDoTime;
    return _rodadasDoTime;
  }
}
