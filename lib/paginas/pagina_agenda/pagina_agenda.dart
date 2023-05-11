// ignore_for_file: prefer_const_constructors

import 'package:camp_brasileiro_app/modelos/modelo_rodada_time.dart';
import 'package:camp_brasileiro_app/paginas/pagina_agenda/pagina_agenda_1T.dart';
import 'package:camp_brasileiro_app/paginas/pagina_agenda/pagina_agenda_2T.dart';
import 'package:flutter/material.dart';

class PaginaAgenda extends StatefulWidget {
  List<modeloRodadaTime> rodadasTime;
  PaginaAgenda({super.key, required this.rodadasTime});

  @override
  State<PaginaAgenda> createState() => _PaginaAgendaState();
}

class _PaginaAgendaState extends State<PaginaAgenda> {
  @override
  Widget build(BuildContext context) {
    int _indiceAtual = 0;
    List<Widget> _paginas = [
      PaginaAgenda1Turno(rodadasTime: widget.rodadasTime),
      PaginaAgenda2Turno(rodadasTime: widget.rodadasTime),
    ];

    void onTabTapped(int index) {
      setState(() {
        _indiceAtual = index;
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Agenda de jogos'),
        ),
        body: _paginas[_indiceAtual],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _indiceAtual,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: '1º Turno',
              icon: Icon(Icons.first_page),
            ),
            BottomNavigationBarItem(
              label: '2º Turno',
              icon: Icon(Icons.last_page),
            ),
          ],
        ));
  }
}
