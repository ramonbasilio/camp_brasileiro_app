// ignore_for_file: prefer_const_constructors

import 'package:camp_brasileiro_app/paginas/teste/pagina_teste1.dart';
import 'package:camp_brasileiro_app/paginas/teste/pagina_teste2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PaginaTestePrincipal extends StatefulWidget {
  const PaginaTestePrincipal({super.key});

  @override
  State<PaginaTestePrincipal> createState() => _PaginaTestePrincipalState();
}

class _PaginaTestePrincipalState extends State<PaginaTestePrincipal> {
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
          PaginaTeste1(),
          PaginaTeste2(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Pagina 1'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Pagina 2'),
        ],
        onTap: (pagina){
          pc.animateToPage(pagina, duration: Duration(milliseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}
