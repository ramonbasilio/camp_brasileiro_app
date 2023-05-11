import 'package:camp_brasileiro_app/modelos/modelo_rodada_time.dart';
import 'package:flutter/material.dart';

class PaginaAgenda2Turno extends StatelessWidget {
  List<modeloRodadaTime> rodadasTime;
  PaginaAgenda2Turno({super.key, required this.rodadasTime});

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

      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: rodadasTime.length,
          itemBuilder: (context, index) {
            print(index);
            int index2T = index + 18;
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Container(
                
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8)
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                
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
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(
                                'Rodada $index2T',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Center(
                            child: testaDados(index2T)
                                ? Text(
                                    '${rodadasTime[index2T].partidas['data_realizacao']}',
                                    textAlign: TextAlign.center,
                                  )
                                : const Text('Sem agenda'),
                          ),
                          Center(
                            child: testaDados(index2T)
                                ? Text(
                                    '${rodadasTime[index2T].partidas['hora_realizacao']}',
                                    textAlign: TextAlign.center,
                                  )
                                : null,
                          ),
                          Center(
                            child: testaDados(index2T)
                                ? Text(
                                    '${rodadasTime[index2T].partidas['estadio']['nome_popular']}',
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
                                        'assets/escudos/${rodadasTime[index2T].partidas['time_mandante']['time_id']}.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                      '${rodadasTime[index2T].partidas['time_mandante']['sigla']}',
                                      style: const TextStyle(fontSize: 20)),
                                ),
                                const Expanded(child: SizedBox.shrink()),
                                testaPlacar(index2T)
                                    ? Text(
                                        '${rodadasTime[index2T].partidas['placar_mandante']}',
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
                                        'assets/escudos/${rodadasTime[index2T].partidas['time_visitante']['time_id']}.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                      '${rodadasTime[index2T].partidas['time_visitante']['sigla']}',
                                      style: const TextStyle(fontSize: 20)),
                                ),
                                const Expanded(child: SizedBox.shrink()),
                                testaPlacar(index2T)
                                    ? Text(
                                        '${rodadasTime[index2T].partidas['placar_visitante']}',
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
            );
          },
        ),
      ),
    );
  }
}
