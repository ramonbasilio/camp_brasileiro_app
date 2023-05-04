// ignore_for_file: must_be_immutable

import 'package:camp_brasileiro_app/modelos/rodada_modelo_completa.dart';
import 'package:camp_brasileiro_app/modelos/rodada_modelo_time.dart';
import 'package:camp_brasileiro_app/paginas/pagina_resumo/pagina_resumo_time.dart';
import 'package:camp_brasileiro_app/modelos/tabela_modelo.dart';
import 'package:camp_brasileiro_app/repositorios/repositorio_provider.dart';
import 'package:flutter/material.dart';

class LisTileTimes extends StatelessWidget {
  List<modeloTime> tabelaCompleta;
  List<modeloRodada> todasRodadas;
  int index;

  LisTileTimes(
      {super.key,
      required this.tabelaCompleta,
      required this.index,
      required this.todasRodadas});

  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: () {
        List<modeloRodadaTime> rodadasTime = 
          repositorioProvider().proximasRodadasFunc(
              tabelaCompleta[index].time['nome_popular'],
              todasRodadas);
       

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaginaResumoTime(
              index: index,
              tabelaCompleta: tabelaCompleta, 
              rodadasTime: rodadasTime,
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
                'assets/escudos/${tabelaCompleta[index].time['time_id']}.png'),
          ),
        ),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
              width: 100,
              child: Text('${tabelaCompleta[index].time['nome_popular']}')),
          SizedBox(
              width: 30,
              child:
                  Center(child: Text(tabelaCompleta[index].pontos.toString()))),
          SizedBox(
            width: 30,
            child: Center(
              child: Text(tabelaCompleta[index].jogos.toString()),
            ),
          ),
          SizedBox(
            width: 30,
            child: Center(
              child: Text(tabelaCompleta[index].vitorias.toString()),
            ),
          ),
          SizedBox(
            width: 30,
            child: Center(
              child: Text(tabelaCompleta[index].empates.toString()),
            ),
          ),
          SizedBox(
            width: 30,
            child: Center(
              child: Text(tabelaCompleta[index].derrotas.toString()),
            ),
          ),
        ],
      ),
      subtitle: Text('${tabelaCompleta[index].posicao}'),
    );
  }
}
