import 'package:camp_brasileiro_app/tabela_modelo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
      body: Column(children: [
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
        Text('Posição Atual: ${widget.times[widget.index].posicao}'),
        Text('Pontos Atual: ${widget.times[widget.index].pontos}'),
        Text('Jogos Disputados: ${widget.times[widget.index].jogos}'),
        Text('Vitórias: ${widget.times[widget.index].vitorias}'),
        Text('Empates: ${widget.times[widget.index].empates}'),
        Text('Derrotas: ${widget.times[widget.index].derrotas}'),
        Text('Gols Pró: ${widget.times[widget.index].gols_contra}'),
        Text('Saldo Gols: ${widget.times[widget.index].saldo_gols}'),
        Text('Aproveitamento: ${widget.times[widget.index].aproveitamento}'),
        Text('Variação de posição: ${widget.times[widget.index].variacao_posicao}'),        
      ]),
    );
  }
}
