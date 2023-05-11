// ignore_for_file: camel_case_types, non_constant_identifier_names

class modeloTime {
  int posicao;
  int pontos;
  Map<String, dynamic> time;
  int jogos;
  int vitorias;
  int empates;
  int derrotas;
  int gols_pro;
  int gols_contra;
  int saldo_gols;
  int aproveitamento;
  int variacao_posicao;
  List<String> ultimos_jogos;

  modeloTime({
    required this.posicao,
    required this.pontos,
    required this.time,
    required this.jogos,
    required this.vitorias,
    required this.empates,
    required this.derrotas,
    required this.gols_pro,
    required this.gols_contra,
    required this.saldo_gols,
    required this.aproveitamento,
    required this.variacao_posicao,
    required this.ultimos_jogos,
  });

  factory modeloTime.fromJson(Map<String, dynamic> json) {
    return modeloTime(
      posicao: json['posicao'],
      pontos: json['pontos'],
      time: json['time'],
      jogos: json['jogos'],
      vitorias: json['vitorias'],
      empates: json['empates'],
      derrotas: json['derrotas'],
      gols_pro: json['gols_pro'],
      gols_contra: json['gols_contra'],
      saldo_gols: json['saldo_gols'],
      aproveitamento: json['aproveitamento'],
      variacao_posicao: json['variacao_posicao'],
      ultimos_jogos: List<String>.from(json['ultimos_jogos']),
    );
  }
}
