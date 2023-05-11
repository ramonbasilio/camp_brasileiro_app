// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:camp_brasileiro_app/modelos/modelo_resumo_partida.dart';
import 'package:camp_brasileiro_app/repositorios/repositorio_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PaginaTeste extends StatefulWidget {
  const PaginaTeste({super.key});

  @override
  State<PaginaTeste> createState() => _PaginaTesteState();
}

class _PaginaTesteState extends State<PaginaTeste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina teste - Resumo do Jogo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
      ),
    );
  }
}
