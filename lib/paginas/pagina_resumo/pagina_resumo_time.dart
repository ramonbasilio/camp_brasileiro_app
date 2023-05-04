// ignore_for_file: must_be_immutable
import 'package:camp_brasileiro_app/modelos/rodada_modelo_completa.dart';
import 'package:camp_brasileiro_app/modelos/rodada_modelo_time.dart';
import 'package:camp_brasileiro_app/paginas/pagina_tabela/widget/widget/ultimos_jogos.dart';
import 'package:camp_brasileiro_app/modelos/tabela_modelo.dart';
import 'package:camp_brasileiro_app/repositorios/repositorio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PaginaResumoTime extends StatefulWidget {
  List<modeloRodadaTime> rodadasTime;
  List<modeloTime> tabelaCompleta;
  int index;
  PaginaResumoTime(
      {super.key,
      required this.tabelaCompleta,
      required this.index,
      required this.rodadasTime});

  @override
  State<PaginaResumoTime> createState() => _PaginaResumoTimeState();
}

class _PaginaResumoTimeState extends State<PaginaResumoTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('${widget.tabelaCompleta[widget.index].time['nome_popular']}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image(
                    image: AssetImage(
                        'assets/escudos/${widget.tabelaCompleta[widget.index].time['time_id']}.png'),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.grey.shade200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Resumo do time',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  ListTile(
                    title: Center(
                      child: Text(
                        widget.tabelaCompleta[widget.index].gols_pro.toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Center(
                        child: Text(
                            'GOLS FEITOS  - Média de ${(widget.tabelaCompleta[widget.index].gols_pro / widget.tabelaCompleta[widget.index].jogos).toPrecision(2)} gol(s) por partida')),
                  ),
                  ListTile(
                    title: Center(
                      child: Text(
                        widget.tabelaCompleta[widget.index].gols_contra
                            .toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Center(
                        child: Text(
                            'GOLS SOFRIDOS - Média de ${(widget.tabelaCompleta[widget.index].gols_contra / widget.tabelaCompleta[widget.index].jogos).toPrecision(2)} gol(s) sofridos por partida')),
                  ),
                  ListTile(
                    title: Center(
                      child: Text(
                        widget.tabelaCompleta[widget.index].saldo_gols
                            .toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: const Center(
                      child: Text('SALDO DE GOLS'),
                    ),
                  ),
                  const ListTile(
                    title: Center(
                      child: Text(
                        '5',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Center(
                      child: Text('CARTÕES AMARELOS'),
                    ),
                  ),
                  const ListTile(
                    title: Center(
                      child: Text(
                        '1',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Center(
                      child: Text('CARTÕES VERMELHO'),
                    ),
                  ),
                  ListTile(
                    title: Center(
                      child: Text(
                        '${widget.tabelaCompleta[widget.index].aproveitamento.toString()} %',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: const Center(
                      child: Text('APROVEITAMENTO'),
                    ),
                  ),
                  ListTile(
                    title: Center(
                        child: UltimosJogos(
                      index: widget.index,
                      times: widget.tabelaCompleta,
                    )),
                    subtitle: const Center(
                      child: Text('ÚLTIMOS JOGOS'),
                    ),
                  ),
                  ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 1,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.rodadasTime.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            leading:
                                Text('${widget.rodadasTime[index].rodada}'),
                            title: Center(
                                child: Text(
                                    '${widget.rodadasTime[index].partidas['placar']}')),
                            subtitle: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: widget.rodadasTime[index].partidas['data_realizacao'] != null ? Text(
                                    '${widget.rodadasTime[index].partidas['data_realizacao']} '
                                    '${widget.rodadasTime[index].partidas['hora_realizacao']} '
                                    '${widget.rodadasTime[index].partidas['estadio']['nome_popular']}'
                              ) :const Text('Jogo agendado'),
                            ),
                      )));
                    },
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
