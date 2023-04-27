// ignore_for_file: must_be_immutable

import 'package:camp_brasileiro_app/Paginas/widget/ultimos_jogos.dart';
import 'package:camp_brasileiro_app/tabela_modelo.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PaginaResumoTime extends StatefulWidget {
  List<modeloTime> times;
  int index;
  PaginaResumoTime({super.key, required this.times, required this.index});

  @override
  State<PaginaResumoTime> createState() => _PaginaResumoTimeState();
}

class _PaginaResumoTimeState extends State<PaginaResumoTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.times[widget.index].time['nome_popular']}'),
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
                        'assets/escudos/${widget.times[widget.index].time['time_id']}.png'),
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
                        widget.times[widget.index].gols_pro.toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Center(
                        child: Text(
                            'GOLS FEITOS  - Média de ${(widget.times[widget.index].gols_pro / widget.times[widget.index].jogos).toPrecision(2)} gol(s) por partida')),
                  ),
                  ListTile(
                    title: Center(
                      child: Text(
                        widget.times[widget.index].gols_contra.toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Center(
                        child: Text(
                            'GOLS SOFRIDOS - Média de ${(widget.times[widget.index].gols_contra / widget.times[widget.index].jogos).toPrecision(2)} gol(s) sofridos por partida')),
                  ),
                  ListTile(
                    title: Center(
                      child: Text(
                        widget.times[widget.index].saldo_gols.toString(),
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
                        '${widget.times[widget.index].aproveitamento.toString()} %',
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
                      times: widget.times,
                    )),
                    subtitle: const Center(
                      child: Text('ÚLTIMOS JOGOS'),
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
