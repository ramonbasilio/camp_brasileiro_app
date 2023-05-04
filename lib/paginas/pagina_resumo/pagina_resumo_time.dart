// ignore_for_file: must_be_immutable
import 'package:camp_brasileiro_app/modelos/rodada_modelo_time.dart';
import 'package:camp_brasileiro_app/paginas/agenda/pagina_agenda.dart';
import 'package:camp_brasileiro_app/paginas/pagina_tabela/widget/widget/ultimos_jogos.dart';
import 'package:camp_brasileiro_app/modelos/tabela_modelo.dart';
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
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaginaAgenda(
                                rodadasTime: widget.rodadasTime,
                              ),
                            ));
                      },
                      child: Text('Agenda do time'),
                    ),
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
