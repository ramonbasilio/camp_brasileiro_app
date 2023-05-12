import 'package:camp_brasileiro_app/modelos/modelo_resumo_partida.dart';
import 'package:camp_brasileiro_app/paginas/pagina_resumo_partida/pagina_resumo_partida.dart';
import 'package:camp_brasileiro_app/paginas/pagina_resumo_partida/pagina_resumo_partida_escala.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PaginaNavegacao extends StatefulWidget {
  modeloResumoPartida resumoPartida;

  PaginaNavegacao({super.key, required this.resumoPartida});

  @override
  State<PaginaNavegacao> createState() => _PaginaNavegacaoState();
}

class _PaginaNavegacaoState extends State<PaginaNavegacao> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
          PaginaResumoPartida(resumoPartida: widget.resumoPartida),
          PaginaResumoPartidaEscalacao(),

        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Pagina 1'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Pagina 2'),
        ],
        onTap: (pagina) {
          pc.animateToPage(pagina,
              duration: Duration(milliseconds: 400), curve: Curves.ease);
        },
      ),
    );
    ;
  }
}
