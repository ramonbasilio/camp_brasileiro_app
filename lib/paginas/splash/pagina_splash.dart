import 'package:camp_brasileiro_app/modelos/rodada_modelo_completa.dart';
import 'package:camp_brasileiro_app/modelos/tabela_modelo.dart';
import 'package:camp_brasileiro_app/paginas/pagina_tabela/pagina_tabela.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camp_brasileiro_app/repositorios/repositorio_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: Future.wait([
          Provider.of<repositorioProvider>(context, listen: false)
              .todasRodadas(),
          Provider.of<repositorioProvider>(context, listen: false)
              .tabelaCampeonato(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao buscar dados!'));
          } else {
            List<modeloRodada>? resumoRodada = snapshot.data?[0];
            List<modeloTime>? resumoTabela = snapshot.data?[1];
            if (resumoRodada != null &&
                resumoTabela != null &&
                resumoRodada.isNotEmpty &&
                resumoTabela.isNotEmpty) {
              Future.delayed(const Duration(seconds: 2)).then((_) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const PaginaTabela2()));
              });
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child:  Center(child:Text('Dados Carregados com sucesso!')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: resumoRodada!.isNotEmpty ? const Text('Rodada carregada') : null ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: resumoTabela!.isNotEmpty ? const Text('Tabela carregada') : null ),
              )
            ]);
          }
        },
      ),
    );
  }
}
