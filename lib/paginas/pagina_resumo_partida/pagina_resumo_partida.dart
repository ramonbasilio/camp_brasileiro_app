import 'package:camp_brasileiro_app/modelos/modelo_resumo_partida.dart';
import 'package:flutter/material.dart';

class PaginaResumoPartida extends StatefulWidget {
  modeloResumoPartida resumoPartida;

  PaginaResumoPartida({super.key, required this.resumoPartida});

  @override
  State<PaginaResumoPartida> createState() => _PaginaResumoPartidaState();
}

class _PaginaResumoPartidaState extends State<PaginaResumoPartida> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo da Partida'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 110,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      color: Colors.grey.shade200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '${widget.resumoPartida.estatisticas['mandante']['posse_de_bola']}'),
                          const Text('Posse de bola'),
                          Text(
                              '${widget.resumoPartida.estatisticas['visitante']['posse_de_bola']}'),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  //-------------------------------------------------------------------------//
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      color: Colors.grey.shade200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '${widget.resumoPartida.estatisticas['mandante']['escanteios']}'),
                          const Text('Escanteios'),
                          Text(
                              '${widget.resumoPartida.estatisticas['visitante']['escanteios']}'),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  //-------------------------------------------------------------------------//
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      color: Colors.grey.shade200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '${widget.resumoPartida.estatisticas['mandante']['impedimentos']}'),
                          const Text('Impedimentos'),
                          Text(
                              '${widget.resumoPartida.estatisticas['visitante']['impedimentos']}'),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  //-------------------------------------------------------------------------//
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                        height: 50,
                        width: double.maxFinite,
                        color: Colors.grey.shade200,
                        child: const Center(child: Text('Passes'))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${widget.resumoPartida.estatisticas['mandante']['passes']['total']}'),
                            const Text('Total'),
                            Text(
                                '${widget.resumoPartida.estatisticas['visitante']['passes']['total']}'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${widget.resumoPartida.estatisticas['mandante']['passes']['completos']}'),
                            const Text('Completos'),
                            Text(
                                '${widget.resumoPartida.estatisticas['visitante']['passes']['completos']}'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${widget.resumoPartida.estatisticas['mandante']['passes']['errados']}'),
                            const Text('Errados'),
                            Text(
                                '${widget.resumoPartida.estatisticas['visitante']['passes']['errados']}'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${widget.resumoPartida.estatisticas['mandante']['passes']['precisao']}'),
                            const Text('Precisão'),
                            Text(
                                '${widget.resumoPartida.estatisticas['visitante']['passes']['precisao']}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //-------------------------------------------------------------------------//
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                        height: 50,
                        width: double.maxFinite,
                        color: Colors.grey.shade200,
                        child: const Center(child: Text('Finalização'))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${widget.resumoPartida.estatisticas['mandante']['finalizacao']['total']}'),
                            const Text('Total'),
                            Text(
                                '${widget.resumoPartida.estatisticas['visitante']['finalizacao']['total']}'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${widget.resumoPartida.estatisticas['mandante']['finalizacao']['no_gol']}'),
                            const Text('No gol'),
                            Text(
                                '${widget.resumoPartida.estatisticas['visitante']['finalizacao']['no_gol']}'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${widget.resumoPartida.estatisticas['mandante']['finalizacao']['pra_fora']}'),
                            const Text('Para fora'),
                            Text(
                                '${widget.resumoPartida.estatisticas['visitante']['finalizacao']['pra_fora']}'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${widget.resumoPartida.estatisticas['mandante']['finalizacao']['na_trave']}'),
                            const Text('Na trave'),
                            Text(
                                '${widget.resumoPartida.estatisticas['visitante']['finalizacao']['na_trave']}'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${widget.resumoPartida.estatisticas['mandante']['finalizacao']['bloqueado']}'),
                            const Text('Bloqueado'),
                            Text(
                                '${widget.resumoPartida.estatisticas['visitante']['finalizacao']['bloqueado']}'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${widget.resumoPartida.estatisticas['mandante']['finalizacao']['precisao']}'),
                            const Text('Precisão'),
                            Text(
                                '${widget.resumoPartida.estatisticas['visitante']['finalizacao']['precisao']}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //-------------------------------------------------------------------------//
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                        height: 50,
                        width: double.maxFinite,
                        color: Colors.grey.shade200,
                        child: const Center(child: Text('Defesa'))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${widget.resumoPartida.estatisticas['mandante']['defensivo']['defesas']}'),
                            const Text('Defesas totais'),
                            Text(
                                '${widget.resumoPartida.estatisticas['visitante']['defensivo']['defesas']}'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${widget.resumoPartida.estatisticas['mandante']['desarmes']}'),
                            const Text('Desarmes'),
                            Text(
                                '${widget.resumoPartida.estatisticas['visitante']['desarmes']}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //-------------------------------------------------------------------------//
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                        height: 50,
                        width: double.maxFinite,
                        color: Colors.grey.shade200,
                        child: const Center(child: Text('Faltas'))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${widget.resumoPartida.estatisticas['mandante']['faltas']}'),
                            const Text('Faltas totais'),
                            Text(
                                '${widget.resumoPartida.estatisticas['visitante']['faltas']}'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${widget.resumoPartida.cartoes['amarelo']['mandante'].length}'),
                            Row(
                              children: [
                                const Text('Cartão Amarelo'),
                                Container(
                                  margin: const EdgeInsets.all(3),
                                  width: 8,
                                  height: 12,
                                  decoration: const BoxDecoration(
                                    color: Colors.yellow,
                                    shape: BoxShape.rectangle,
                                  ),
                                )
                              ],
                            ),
                            Text(
                                '${widget.resumoPartida.cartoes['amarelo']['visitante'].length}'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${widget.resumoPartida.cartoes['vermelho']['mandante'].length}'),
                            Row(
                              children: [
                                const Text('Cartão Vermelho'),
                                Container(
                                  margin: const EdgeInsets.all(3),
                                  width: 8,
                                  height: 12,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.rectangle,
                                  ),
                                )
                              ],
                            ),
                            Text(
                                '${widget.resumoPartida.cartoes['vermelho']['visitante'].length}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                          child: Image(
                            image: AssetImage(
                                'assets/escudos/${widget.resumoPartida.timeMandante['time_id']}.png'),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Mandante',
                            style: TextStyle(color: Colors.black26),
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    '${widget.resumoPartida.placaMandante}',
                    style: const TextStyle(fontSize: 30),
                  ),
                  const Text(
                    '-',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    '${widget.resumoPartida.placarVisitante}',
                    style: const TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                          child: Image(
                            image: AssetImage(
                                'assets/escudos/${widget.resumoPartida.timeVisitante['time_id']}.png'),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Visitante',
                            style: TextStyle(color: Colors.black26),
                          ),
                        )
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
  }
}
