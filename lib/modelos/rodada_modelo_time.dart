// ignore_for_file: camel_case_types, non_constant_identifier_names

class modeloRodadaTime {
  String nome;
  String slug;
  int rodada;
  String status;
  Map? proxima_rodada;
  Map? rodada_anterior;
  Map partidas;

  modeloRodadaTime({
    required this.nome,
    required this.slug,
    required this.rodada,
    required this.status,
    required this.proxima_rodada,
    required this.rodada_anterior,
    required this.partidas,
  });

  factory modeloRodadaTime.fromJson(dynamic json) {
    return modeloRodadaTime(
      nome: json['nome'],
      slug: json['slug'],
      rodada: json['rodada'],
      status: json['status'],
      proxima_rodada: json['proxima_rodada'],
      rodada_anterior: json['rodada_anterior'],
      partidas: json['partidas'],
    );
    
  }
}
