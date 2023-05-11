// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:camp_brasileiro_app/modelos/modelo_tabela.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class UltimosJogos extends StatefulWidget {
  List<modeloTime> times;
  int index;
  UltimosJogos({super.key, required this.times, required this.index});

  @override
  State<UltimosJogos> createState() => _UltimosJogosState();
}

class _UltimosJogosState extends State<UltimosJogos> {
  Row listaUltimosJogos(List<modeloTime> times, int index) {
    List<Widget> temp = [];
    for (var element in times[index].ultimos_jogos) {
      if (element == 'v') {
        temp.add(Container(
          margin: const EdgeInsets.all(3),
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
        ));
      } else if (element == 'd') {
        temp.add(Container(
          margin: const EdgeInsets.all(3),
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        ));
      } else if (element == 'e') {
        temp.add(Container(
          margin: const EdgeInsets.all(3),
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
        ));
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: temp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return listaUltimosJogos(widget.times, widget.index);
  }
}
