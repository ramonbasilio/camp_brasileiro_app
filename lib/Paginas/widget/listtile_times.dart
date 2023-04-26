// ignore_for_file: must_be_immutable

import 'package:camp_brasileiro_app/Paginas/pagina_resumo_time.dart';
import 'package:camp_brasileiro_app/tabela_modelo.dart';
import 'package:flutter/material.dart';

class LisTileTimes extends StatelessWidget {
  List<modeloTime> times;
  int index;
  LisTileTimes({super.key, required this.times, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaginaResumoTime(
              index: index,
              times: times,
            ),
          ),
        );
      },
      leading: SizedBox(
        width: 60,
        height: 60,
        child: Center(
          child: Image(
            image: AssetImage(
                'assets/escudos/${times[index].time['time_id']}.png'),
          ),
        ),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
              width: 100, child: Text('${times[index].time['nome_popular']}')),
          SizedBox(
              width: 30,
              child: Center(child: Text(times[index].pontos.toString()))),
          SizedBox(
            width: 30,
            child: Center(
              child: Text(times[index].jogos.toString()),
            ),
          ),
          SizedBox(
            width: 30,
            child: Center(
              child: Text(times[index].vitorias.toString()),
            ),
          ),
          SizedBox(
            width: 30,
            child: Center(
              child: Text(times[index].empates.toString()),
            ),
          ),
          SizedBox(
            width: 30,
            child: Center(
              child: Text(times[index].derrotas.toString()),
            ),
          ),
        ],
      ),
      subtitle: Text('${times[index].posicao}'),
    );
  }
}
