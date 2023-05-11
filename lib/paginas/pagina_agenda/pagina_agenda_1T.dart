import 'package:camp_brasileiro_app/modelos/modelo_resumo_partida.dart';
import 'package:camp_brasileiro_app/modelos/modelo_rodada_time.dart';
import 'package:camp_brasileiro_app/paginas/pagina_resumo_partida/pagina_resumo_partida.dart';
import 'package:camp_brasileiro_app/paginas/pagina_resumo_time/pagina_resumo_time.dart';
import 'package:camp_brasileiro_app/repositorios/repositorio_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaginaAgenda1Turno extends StatelessWidget {
  List<modeloRodadaTime> rodadasTime;
  PaginaAgenda1Turno({super.key, required this.rodadasTime});

  @override
  Widget build(BuildContext context) {
    bool testaDados(int index) {
      if (rodadasTime[index].partidas['status'] != null &&
          rodadasTime[index].partidas['data_realizacao'] != null &&
          rodadasTime[index].partidas['hora_realizacao'] != null &&
          rodadasTime[index].partidas['estadio'] != null) {
        return true;
      } else {
        return false;
      }
    }

    bool testaPlacar(int index) {
      if (rodadasTime[index].partidas['placar_visitante'] != null ||
          rodadasTime[index].partidas['placar_visitante'] != null) {
        return true;
      } else {
        return false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda - 1º Turno'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: rodadasTime.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: GestureDetector(
                  onTap: () async {
                    if (rodadasTime[index].status == 'encerrada') {
                      int partidaId = rodadasTime[index].partidas['partida_id'];
                      Future<modeloResumoPartida> resumoPartidaFuturo =
                          repositorioProvider().resumoPartidaTime(partidaId);

                      if (context.mounted) {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return FutureBuilder<modeloResumoPartida>(
                                future: resumoPartidaFuturo,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Scaffold(
                                      appBar: AppBar(
                                        title: const Text('Carregando...'),
                                      ),
                                      body: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  } else if (snapshot.hasData) {
                                    modeloResumoPartida resumoPartida =
                                        snapshot.data as modeloResumoPartida;
                                    return PaginaResumoPartida(
                                      resumoPartida: resumoPartida,
                                    );
                                  } else if (snapshot.hasError) {
                                    return Scaffold(
                                      appBar: AppBar(
                                        title: const Text('Ocorreu um erro!'),
                                      ),
                                      body: Center(
                                        child: Text('${snapshot.error}'),
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                });
                          }),
                        );
                      }
                    } else {
                      if (context.mounted) {
                        final snackBar =
                            SnackBar(content: Text('Resumo do partida ainda não disponível'));

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    height: 150,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Text(
                                    'Rodada ${index + 1}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Center(
                                child: testaDados(index)
                                    ? Text(
                                        '${rodadasTime[index].partidas['data_realizacao']}',
                                        textAlign: TextAlign.center,
                                      )
                                    : const Text('Sem agenda'),
                              ),
                              Center(
                                child: testaDados(index)
                                    ? Text(
                                        '${rodadasTime[index].partidas['hora_realizacao']}',
                                        textAlign: TextAlign.center,
                                      )
                                    : null,
                              ),
                              Center(
                                child: testaDados(index)
                                    ? Text(
                                        '${rodadasTime[index].partidas['estadio']['nome_popular']}',
                                        textAlign: TextAlign.center,
                                      )
                                    : null,
                              ),
                            ],
                          ),
                        ),
                        const VerticalDivider(),
                        Flexible(
                          flex: 3,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 55,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 35,
                                      width: 35,
                                      child: Image(
                                        image: AssetImage(
                                            'assets/escudos/${rodadasTime[index].partidas['time_mandante']['time_id']}.png'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                          '${rodadasTime[index].partidas['time_mandante']['sigla']}',
                                          style: const TextStyle(fontSize: 20)),
                                    ),
                                    const Expanded(child: SizedBox.shrink()),
                                    testaPlacar(index)
                                        ? Text(
                                            '${rodadasTime[index].partidas['placar_mandante']}',
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : const Text('-',
                                            style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                              const Divider(),
                              SizedBox(
                                height: 55,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 35,
                                      width: 35,
                                      child: Image(
                                        image: AssetImage(
                                            'assets/escudos/${rodadasTime[index].partidas['time_visitante']['time_id']}.png'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                          '${rodadasTime[index].partidas['time_visitante']['sigla']}',
                                          style: const TextStyle(fontSize: 20)),
                                    ),
                                    const Expanded(child: SizedBox.shrink()),
                                    testaPlacar(index)
                                        ? Text(
                                            '${rodadasTime[index].partidas['placar_visitante']}',
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : const Text('-',
                                            style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
