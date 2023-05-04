import 'package:camp_brasileiro_app/modelos/rodada_modelo_completa.dart';
import 'package:camp_brasileiro_app/paginas/pagina_tabela/widget/widget/cabecalho_tabela.dart';
import 'package:camp_brasileiro_app/paginas/pagina_tabela/widget/widget/listtile_times.dart';

import 'package:camp_brasileiro_app/repositorios/repositorio_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaginaTabela2 extends StatefulWidget {
  const PaginaTabela2({super.key});

  @override
  State<PaginaTabela2> createState() => _PaginaTabela2State();
}

class _PaginaTabela2State extends State<PaginaTabela2> {
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
            child: Consumer<repositorioProvider>(
              builder: (context, value, child) {
                if (value.tabelaCompleta.isEmpty) {
                  value.tabelaCampeonato();
                  return const CircularProgressIndicator();
                } else {
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 1,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: value.tabelaCompleta.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: LisTileTimes(
                          index: index,
                          tabelaCompleta: value.tabelaCompleta,
                          todasRodadas: value.resumoDasPartidas,
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
