// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:camp_brasileiro_app/modelos/modelo_resumo_partida.dart';
import 'package:camp_brasileiro_app/repositorios/repositorio_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PaginaTeste1 extends StatefulWidget {
  const PaginaTeste1({super.key});

  @override
  State<PaginaTeste1> createState() => _PaginaTeste1State();
}

class _PaginaTeste1State extends State<PaginaTeste1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina teste - Resumo do Jogo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
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
                          const Text('59%'),
                          const Text('Passe'),
                          const Text('41%'),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
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
                          const Text('59%'),
                          const Text('Escanteios'),
                          const Text('41%'),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
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
                          const Text('59%'),
                          const Text('Impedimentos'),
                          const Text('41%'),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
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
                          const Text('59%'),
                          const Text('Faltas'),
                          const Text('41%'),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
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
                            const Text('585'),
                            const Text('Total'),
                            const Text('600'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('585'),
                            const Text('Completos'),
                            const Text('600'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('585'),
                            const Text('Errados'),
                            const Text('600'),
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
                            const Text('585'),
                            const Text('Total'),
                            const Text('600'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('585'),
                            const Text('No gol'),
                            const Text('600'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('585'),
                            const Text('Para fora'),
                            const Text('600'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('585'),
                            const Text('Na trave'),
                            const Text('600'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('585'),
                            const Text('Bloqueado'),
                            const Text('600'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('585'),
                            const Text('Precisão'),
                            const Text('600'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
