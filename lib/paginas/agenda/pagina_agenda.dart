import 'package:camp_brasileiro_app/modelos/rodada_modelo_time.dart';
import 'package:flutter/material.dart';

class PaginaAgenda extends StatelessWidget {
  List<modeloRodadaTime> rodadasTime;

  PaginaAgenda({super.key, required this.rodadasTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda de jogos'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 1,
          );
        },
        scrollDirection: Axis.vertical,
        itemCount: rodadasTime.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text('${rodadasTime[index].rodada}'),
            title:
                Center(child: Text('${rodadasTime[index].partidas['placar']}')),
            subtitle: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: rodadasTime[index].partidas['status'] != null && 
                rodadasTime[index].partidas['data_realizacao'] != null && 
                rodadasTime[index].partidas['hora_realizacao'] != null &&
                rodadasTime[index].partidas['estadio'] != null
                    ? Text('${rodadasTime[index].partidas['data_realizacao']} '
                        '${rodadasTime[index].partidas['hora_realizacao']} '
                        '${rodadasTime[index].partidas['estadio']['nome_popular']}')
                    : const Text('Jogo agendado'),
              ),
            ),
          );
        },
      ),
    );
  }
}
