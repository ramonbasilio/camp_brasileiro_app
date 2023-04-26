import 'package:camp_brasileiro_app/Paginas/widget/cabecalho_tabela.dart';
import 'package:camp_brasileiro_app/Paginas/widget/listtile_times.dart';
import 'package:camp_brasileiro_app/repositorio.dart';
import 'package:camp_brasileiro_app/tabela_modelo.dart';
import 'package:flutter/material.dart';

class PaginaTabela extends StatefulWidget {
  const PaginaTabela({super.key});

  @override
  State<PaginaTabela> createState() => _PaginaTabelaState();
}

class _PaginaTabelaState extends State<PaginaTabela> {
  final repositorio _repositorio = repositorio();
  Future<List<modeloTime>>? _timesFuture;

  @override
  void initState() {
    //_timesFuture = _repositorio.carregaDadosEstaticos();
    _timesFuture = _repositorio.callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Tabela Brasileirão - 2023'),
        ),
      ),
      body: Column(
        children: [
          const CabecalhoTabela(),
          Expanded(
            child: FutureBuilder(
              future: _timesFuture,
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Erro: ${snapshot.error}');
                } else {
                  List<modeloTime> times = snapshot.data as List<modeloTime>;
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 1,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: times.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: LisTileTimes(
                          index: index,
                          times: times,
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}


