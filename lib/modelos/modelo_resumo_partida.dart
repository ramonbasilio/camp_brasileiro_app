// ignore_for_file: camel_case_types
class modeloResumoPartida {
  int partidaId;
  Map<String, dynamic> campeonato;
  String? placar;
  Map<String, dynamic> timeMandante;
  Map<String, dynamic> timeVisitante;
  int placaMandante;
  int placarVisitante;
  bool disputaPenalti;
  String? status;
  String? dataRealizacao;
  String? horaRealizacao;
  Map<String, dynamic> estadio;
  String? rodada;
  Map<String, dynamic> estatisticas;
  Map<String, dynamic> escalacoes;
  Map<String, dynamic> gols;
  Map<String, dynamic> substituicoes;
  Map<String, dynamic> cartoes;

  modeloResumoPartida(
      {required this.partidaId,
      required this.campeonato,
      required this.placar,
      required this.timeMandante,
      required this.timeVisitante,
      required this.placaMandante,
      required this.placarVisitante,
      required this.disputaPenalti,
      required this.status,
      required this.dataRealizacao,
      required this.horaRealizacao,
      required this.estadio,
      required this.rodada,
      required this.estatisticas,
      required this.escalacoes,
      required this.gols,
      required this.substituicoes,
      required this.cartoes});

  factory modeloResumoPartida.fromJson(dynamic json) {
    return modeloResumoPartida(
        partidaId: json['partida_id'],
        campeonato: json['campeonato'],
        placar: json['placar'],
        timeMandante: json['time_mandante'],
        timeVisitante: json['time_visitante'],
        placaMandante: json['placar_mandante'],
        placarVisitante: json['placar_visitante'],
        disputaPenalti: json['disputa_penalti'],
        status: json['status'],
        dataRealizacao: json['data_realizacao'],
        horaRealizacao: json['hora_realizacao'],
        estadio: json['estadio'],
        rodada: json['rodada'],
        estatisticas: json['estatisticas'],
        escalacoes: json['escalacoes'],
        gols: json['gols'],
        substituicoes: json['substituicoes'],
        cartoes: json['cartoes']);
  }
}
